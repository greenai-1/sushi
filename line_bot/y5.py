import cv2
import numpy as np
import os
import sys
from datetime import datetime

# 設定 YOLOv4 相關檔案的路徑
namPath = cfgPath = "C:/Users/badc0/Desktop/DjangoBLOG/User_photo/"
namFile = "test.names"
cfgFile = "yolov4-test.cfg"
nam_F = namPath + namFile
cfg_F = cfgPath + cfgFile

weiPath = "C:/Users/badc0/Desktop/DjangoBLOG/User_photo/"
weiFile = "yolov4-test_last.weights"
wei_F = weiPath + weiFile

imgPath = "C:/Users/badc0/Desktop/DjangoBLOG/User_photo/"
imgFile = "initial_photo.jpg"
img_F = imgPath + imgFile

# 設定結果輸出資料夾
output_folder = "C:/Users/badc0/Desktop/DjangoBLOG/y1"
os.makedirs(output_folder, exist_ok=True)

# 預設值 
imageON_ = True
scoreTHRESHOLD_ = 0.5
nmsTHRESHOLD_ = 0.4

# 壽司中文名稱
tbl_sushi_name = { 
    'Salmon_Sushi': '鮭魚壽司', 
    'Tuna_Sushi': '鮪魚壽司', 
    'Tamagoyaki_Sushi': '玉子燒壽司', 
    'Inari_Sushi': '豆皮壽司', 
    'Salmon_Roe_Gunkan': '鮭魚卵軍艦卷'
}

# 壽司每份碳排放量(gCO2-e)
tbl_sushi_gco2e = {
    'Salmon_Sushi': 81.868, 
    'Tuna_Sushi': 146.308, 
    'Tamagoyaki_Sushi': 92.038, 
    'Inari_Sushi': 56.158, 
    'Salmon_Roe_Gunkan': 76.278
}

# 壽司每份熱量(kcal)
tbl_sushi_kcal = {
    'Salmon_Sushi': 88.386, 
    'Tuna_Sushi': 73.746, 
    'Tamagoyaki_Sushi': 85.896, 
    'Inari_Sushi': 100.426, 
    'Salmon_Roe_Gunkan': 80.326  
}

# 壽司每份預設重量(g)
tbl_sushi_weight = {
    'Salmon_Sushi': 30.2, 
    'Tuna_Sushi': 30.2, 
    'Tamagoyaki_Sushi': 33.2, 
    'Inari_Sushi': 37.2, 
    'Salmon_Roe_Gunkan': 25.2  
}

# 讀取類別名稱
classes = []
with open(nam_F, "r") as f:
    classes = [line.strip() for line in f.readlines()]

# 載入 YOLOv4 模型
net = cv2.dnn.readNet(wei_F, cfg_F)
layer_names = net.getLayerNames()
output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]

# 讀取圖像
img = cv2.imread(img_F)
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
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]

        if confidence > scoreTHRESHOLD_:
            class_ids.append(class_id)
            confidences.append(float(confidence))
            center_x = int(detection[0] * width)
            center_y = int(detection[1] * height)
            w = int(detection[2] * width)
            h = int(detection[3] * height)
            x = int(center_x - w / 2)
            y = int(center_y - h / 2)
            boxes.append([x, y, w, h])

print("========= 識食減碳-辨識結果 =========")
indexes = cv2.dnn.NMSBoxes(boxes, confidences, scoreTHRESHOLD_, nmsTHRESHOLD_)
print(f"符合物件: {len(indexes)} 個")

font = cv2.FONT_HERSHEY_PLAIN
sum_co2e = 0
sum_kcal = 0
results = []

for i in range(len(boxes)):
    if i in indexes:
        label = str(classes[class_ids[i]])
        confi = str(round(confidences[i] * 100, 2))
        sushi_name = tbl_sushi_name[label]

        result = f'壽司種類: {sushi_name:8} 辨識率: {confi:6}% 重量: {tbl_sushi_weight[label]:6} g 碳排量: {tbl_sushi_gco2e[label]:8} gCO2e 熱量: {tbl_sushi_kcal[label]:6} KCal'
        print(result)
        results.append(result)

        sum_co2e += tbl_sushi_gco2e[label]
        sum_kcal += tbl_sushi_kcal[label]

        if imageON_:
            x, y, w, h = boxes[i]
            color = (0, 255, 0)
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), font, 2, color, 2)

if sum_co2e != 0:
    total_result = f'本次適食, 碳排量小計: {round(sum_co2e, 6):6} gCO2e 熱量小計: {round(sum_kcal, 6):6} KCal'
    print(total_result)
    results.append(total_result)

# 保存圖像和結果
if imageON_:
    output_image = os.path.join(output_folder, "image.jpg")
    cv2.imwrite(output_image, img)

output_txt = os.path.join(output_folder, "fileone.txt")
with open(output_txt, "w", encoding="utf-8") as f:
    f.write("\n".join(results))

cv2.waitKey(0)
cv2.destroyAllWindows()