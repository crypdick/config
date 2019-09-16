"""
Documentation:
https://maker.ifttt.com/use/cyM6FkGTEiki8_rax67boq9sgsJ-QN9bWxbfDYu-YK5

"""
import requests
import fire

event = "holla_back"

endpoint = "https://maker.ifttt.com/trigger/{event}/with/key/cyM6FkGTEiki8_rax67boq9sgsJ-QN9bWxbfDYu-YK5".format(event=event)


def holla(msg="", song = "Starcraft nuclear launch detected"):
    """
    sends an SMS message
    """
    payload = { "value1" : song, "value2" : msg, "value3" : "" }
    print(requests.post(endpoint, params=payload))

if __name__ == '__main__':
    fire.Fire(holla)

