import socket
from sys import argv
import time

class Server():
	def __init__(self):
		self.serverhost = '127.0.0.1'
		self.serverport = 8004
		self.max_client = 45
		self.auth_dict = {}
		self.key_store = {}
		
	def initilize(self):
		for i in range(1,self.max_client+1):
			self.auth_dict[i] = "guest"
			self.key_store[i] = {}
	def query(self):
		while True:
			res=input("Want To Continue : ")
			if(res=='N' or res=='n'):
				break
			while True:
				res=input('Want to Change The authorization to any Client(y/n) : ')
				if(res=="y" or res=="Y"):
					client_no,auth=input('Enter The Client No and authorization type : ').split()
					self.auth_dict[int(client_no)]=auth
					print('Client '+client_no+'is now a '+auth+'!!!')
				else:
					break
			#creating sock
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
			#binding with the client
			sock.bind((self.serverhost,self.serverport))
			sock.listen(1)
			conn = sock.accept()

			save_value=[]
			reciver=[]
			flag=False
			data = conn[0].recv(1024).decode()
			while data:
				print(data)
				if(data=="end"):
					break
				save_value.append(data)
				#print(data, end=',')
				data = conn[0].recv(1024).decode()

			slen = len(save_value)
			client_no=int(save_value[3])
			i=4

			for i in range(slen):
				if(save_value[i]=='get'):
					try:
						if save_value[i+1] in self.key_store[client_no]:
							print("Value For the Key "+ save_value[i+1]+" been found")
							reciver.append(self.key_store[client_no][save_value[i+1]])
						elif self.auth_dict[client_no] == 'manager':
							flag=False
							for j in range(1,self.max_client+1):
								if save_value[i+1] in self.key_store[j]:
									print("Value For the Key "+ save_value[i+1]+" been found")
									reciver.append(self.key_store[j][save_value[i+1]])
									flag=True
									break
							if(flag==False):
								print("Value For the Key "+ save_value[i+1]+" not been found")
								reciver.append("<blank>")
						else:
							print("Value For the Key "+ save_value[i+1]+" not been found")
							reciver.append("<blank>")
					except:
						print("INVALID GET REQUEST!!")
				elif(save_value[i]=='put'):
					try:
						key=save_value[i+1]
						value=save_value[i+2]
						i=i+2
						while i+1<slen:
							if(save_value[i+1]=='put' or save_value[i+1]=='get'):
								break
							value+=(" "+save_value[i+1])
							i+=1
						self.key_store[client_no][key]=value
						print("Value For the Key "+ key+" been saved")
					except:
						print('INVALID PUT REQUEST!!')
			for x in reciver:
				time.sleep(.07)
				conn[0].send(x.encode())
			time.sleep(.07)
			conn[0].send("end".encode())
			conn[0].setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

s = Server()
s.initilize()
s.query()