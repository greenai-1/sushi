import cv2
import numpy as np

# 載入YOLOv4
path_cfg="sushi/cfg/"
path_weights="sushi/weights/"

net = cv2.dnn.readNet(path_weights+"yolov4-test_last-0820.weights", path_cfg+"yolov4-test-0820.cfg")
classes = []
with open(path_cfg+"obj.names", "r") as f:
    classes = [line.strip() for line in f.readlines()]
layer_names = net.getLayerNames()
output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]

# 讀取圖像
img = cv2.imread("sushi/yolos/test/qfugnO1.jpg")
height, width, channels = img.shape

# 檢測物體
blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
net.setInput(blob)
outs = net.forward(output_layers)

# 顯示信息在屏幕上
class_ids = []
confidences = []
boxes = []
for out in outs:
    for detection in out:
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]
        if confidence > 0.5:
            # 物體檢測
            center_x = int(detection[0] * width)
            center_y = int(detection[1] * height)
            w = int(detection[2] * width)
            h = int(detection[3] * height)
            # 矩形坐標
            x = int(center_x - w / 2)
            y = int(center_y - h / 2)
            boxes.append([x, y, w, h])
            confidences.append(float(confidence))
            class_ids.append(class_id)

# 非最大抑制
indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

# 繪製邊界框和標籤
font = cv2.FONT_HERSHEY_PLAIN
for i in range(len(boxes)):
    if i in indexes:
        x, y, w, h = boxes[i]
        label = str(classes[class_ids[i]])
        color = (0, 255, 0)  # 綠色
        cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
        cv2.putText(img, label, (x, y + 30), font, 2, color, 2)

# 顯示結果
cv2.imshow("Image", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
