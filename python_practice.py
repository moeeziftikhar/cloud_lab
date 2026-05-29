# My Python Practice Script
# By Moeez Iftikhar

name = "Moeez"
devices = ["Switch-1", "Router-1", "Server-1"]

def check_device(device):
    print(f"Checking: {device}")

network = input("Enter network range: ")

for device in devices:
    check_device(device)

age = int(input("Enter your age: "))
if age >= 18:
    print("You are an adult!")
else:
    print("You are a minor!")

with open("python_report.txt", "w") as f:
    f.write(f"Report by {name}\n")
    f.write(f"Network: {network}\n")
    for device in devices:
        f.write(f"Device: {device}\n")

print("Report saved!")
