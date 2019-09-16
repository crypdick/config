"""
Documentation:
https://maker.ifttt.com/use/cyM6FkGTEiki8_rax67boq9sgsJ-QN9bWxbfDYu-YK5

"""
import requests

event = "holla_back"

endpoint = "https://maker.ifttt.com/trigger/{event}/with/key/cyM6FkGTEiki8_rax67boq9sgsJ-QN9bWxbfDYu-YK5".format(event=event)

song_title = "Starcraft nuclear launch detected"

payload = { "value1" : song_title, "value2" : "", "value3" : "" }

print(requests.get(endpoint, params=payload))

