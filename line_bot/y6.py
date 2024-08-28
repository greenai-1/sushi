######
# 載入所需套件
# requirements.txt:
# opencv-python==4.10.0.84
# numpy==2.0.1
import cv2
import numpy as np
import json

# Write JSON
def writeJSON( jsonF, data ):
    with open( jsonF, 'w' ) as obj:
        json.dump( data, obj )
# Read JSON 
def readJSON( jsonF ):
    with open( jsonF, 'r' ) as obj:
        return json.load( obj )
# Get DIR and Files from JSON    
def getFiles( jsonObj ):
    return [ jsonObj[i] for i in jsonObj ]

# Read YOLOv4 relative files from sushi.json
jsonObj = readJSON( 'sushi.json' )
proj_DIR, nam_F, cfg_F, wei_F, img_F, ngrokURL = getFiles( jsonObj )
# Adding Path
nam_F = proj_DIR + nam_F
cfg_F = proj_DIR + cfg_F
wei_F = proj_DIR + wei_F

# Default
imageON_        = True
scoreTHRESHOLD_ = 0.5
nmsTHRESHOLD_   = 0.4

# Read table from .json
tbl_sushi_name  = readJSON( 'tbl_sushi_name.json' )         # 壽司中文名稱
tbl_sushi_gco2e = readJSON( 'tbl_sushi_gco2e.json' )        # 壽司每份碳排放量(gCO2-e)
tbl_sushi_kcal  = readJSON( 'tbl_sushi_kcal.json' )         # 壽司每份熱量(kcal)
tbl_sushi_weight= readJSON( 'tbl_sushi_weight.json' )       # 壽司每份預設重量(g)

# 讀取類別檔(壽司種類名稱)
classes = []
with open( nam_F, "r" ) as f:
    classes = [line.strip() for line in f.readlines()]

######
# 載入模型: YOLOv4 Model, pre-trained weights and config
net = cv2.dnn.readNet( wei_F, cfg_F )
layer_names = net.getLayerNames()
output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]

# 讀取圖檔
img = cv2.imread( img_F )
height, width, channels = img.shape

# 檢測物體
blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
net.setInput(blob)
outs = net.forward(output_layers)

# 顯示訊息
class_ids = []
confidences = []
boxes = []
for out in outs:
    for detection in out:

        # 物體檢測
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]

        if confidence > scoreTHRESHOLD_:           
            # 種類,信賴區間
            class_ids.append(class_id)                    
            confidences.append(float(confidence))
            # 矩形坐標
            center_x = int(detection[0] * width)
            center_y = int(detection[1] * height)
            w = int(detection[2] * width)
            h = int(detection[3] * height)
            x = int(center_x - w / 2)
            y = int(center_y - h / 2)
            boxes.append([x, y, w, h])

print("========= 識食減碳-辨識結果 =========")
# 從boxes,confidences列表中,取出符合要求(信賴區間>scoreTHRESHOLD_, NMS < nmsTHRESHOLD_ >)的索引值,放入indexe列表中
indexes = cv2.dnn.NMSBoxes( boxes, confidences, scoreTHRESHOLD_, nmsTHRESHOLD_ )
print(f"符合物件: { len(indexes) } 個")

# 繪製邊界框和標籤
font = cv2.FONT_HERSHEY_PLAIN 
sum_co2e = 0
sum_kcal = 0
for i in range(len(boxes)):
    if i in indexes:
        label = str( classes[class_ids[i]] )                # 標籤分類       
        confi = str( round(confidences[i] * 100, 2) )       # 信賴區間
        sushi_name = tbl_sushi_name[label]
        # 顯示結果
        print(f'壽司種類: {tbl_sushi_name[label]:8} 辨識率: {confi:6}%  預設重量:{tbl_sushi_weight[label]:6} g  碳排量: {tbl_sushi_gco2e[label]:8} gCO2e  熱量: {tbl_sushi_kcal[label]:6} KCal')

        sum_co2e += tbl_sushi_gco2e[label]
        sum_kcal += tbl_sushi_kcal[label]

        # 如果True:加框進圖檔
        if imageON_:       
            x, y, w, h = boxes[i]
            color = (0, 255, 0)  # 綠色
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), font, 2, color, 2)

if sum_co2e != 0:
    print(f'本次適食, 碳排量小計: {round(sum_co2e,6):6} gCO2e  熱量小計: {round(sum_kcal,6):6} KCal')

# 如果True,Show圖並畫框
if imageON_:
    #cv2.imshow("Image", img)
    cv2.imwrite("y1/Image.jpg", img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
