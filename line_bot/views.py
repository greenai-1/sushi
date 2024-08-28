import os
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from datetime import datetime
import subprocess

from linebot import LineBotApi, WebhookParser
from linebot.exceptions import InvalidSignatureError, LineBotApiError
from linebot.models import MessageEvent, TextSendMessage, TextMessage, LocationMessage, ImageMessage, StickerSendMessage, ImageSendMessage, LocationSendMessage

line_bot_api = LineBotApi(settings.LINE_CHANNEL_ACCESS_TOKEN)
parser = WebhookParser(settings.LINE_CHANNEL_SECRET)

@csrf_exempt
def callback(request):
    if request.method == "POST":
        signature = request.META['HTTP_X_LINE_SIGNATURE']
        body = request.body.decode('utf-8')

        try:
            events = parser.parse(body, signature)
        except InvalidSignatureError:
            return HttpResponseForbidden()
        except LineBotApiError:
            return HttpResponseBadRequest()
       
        for event in events:
            print(event)
            if isinstance(event, MessageEvent):
                if isinstance(event.message, TextMessage):
                    res_text = event.message.text
                    if res_text == "@加入會員!第一手優惠":
                        line_bot_api.reply_message(event.reply_token, StickerSendMessage(package_id=6325, sticker_id=10979904))
                    elif res_text == "@請上傳照片":
                         line_bot_api.reply_message(event.reply_token, TextSendMessage(text="請上傳你的照片"))
                    elif res_text == "@偵測結果":
                        img_url = " https://1ff6-140-120-125-3.ngrok-free.app/y1/image.jpg"
                        line_bot_api.reply_message(event.reply_token, ImageSendMessage(original_content_url=img_url, preview_image_url=img_url))
                    elif res_text == "@你的碳排放/熱量":
                        file_path = r"C:\Users\badc0\Desktop\DjangoBLOG\y1\fileone.txt"
                        try:
                            with open(file_path, 'r', encoding='utf-8') as file:
                                lines = file.readlines()

                            formatted_lines = []
                            for line in lines:
                                if "壽司種類:" in line or "本次適食, 碳排量小計:" in line:
                                    formatted_lines.append("\n" + line.strip())
                                else:
                                    formatted_lines.append(line.strip())

                            formatted_content = "\n".join(formatted_lines)

                            line_bot_api.reply_message(event.reply_token, TextSendMessage(text=formatted_content))
                        except Exception as e:
                            line_bot_api.reply_message(event.reply_token, TextSendMessage(text="無法讀取文件內容。"))
                    else:
                        line_bot_api.reply_message(event.reply_token, TextSendMessage(text=res_text))
               
                 # 圖片事件,將照片存下來的地方
                if isinstance(event.message, ImageMessage):
                    # 檢查 User_photo 資料夾是否存在，若不存在則創建它
                    user_photo_folder = os.path.join(settings.BASE_DIR, 'User_photo')
                    if not os.path.exists(user_photo_folder):
                        os.makedirs(user_photo_folder)
                    
                    # 設定圖片儲存的檔案路徑（使用 'initial_photo' 作為檔名）
                    image_path = os.path.join(user_photo_folder, 'initial_photo.jpg')
                    
                    # 取得圖片內容
                    message_content = line_bot_api.get_message_content(event.message.id)
                    
                    # 將圖片內容寫入到檔案
                    with open(image_path, 'wb') as fd:
                        for chunk in message_content.iter_content():
                            fd.write(chunk)
                    y5_script_path = r'C:/Users/badc0/Desktop/DjangoBLOG/line_bot/y5.py'
                    subprocess.run(['python', y5_script_path], check=True)
                    line_bot_api.reply_message(event.reply_token, TextSendMessage(text="圖片已儲存"))

        return HttpResponse()
    else:
        return HttpResponseBadRequest()

def pushMsg(request, uid, msg):
    line_bot_api.push_message(uid, TextSendMessage(text=msg))
    return HttpResponse()