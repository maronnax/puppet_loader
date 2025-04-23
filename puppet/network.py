import socket
import threading
import time
import json
import queue

def udp_listener(sock, result_queue):
    """Continuously listen for incoming UDP packets and call the callback."""
    while True:
        try:
            data, addr = sock.recvfrom(1024)  # Blocking call
            result_queue.put((data.decode(), addr))
            return
        except Exception as e:
            print("Error receiving data:", e)
            break

def get_puppetnet_ip_address(puppetname, host='192.168.4.1', port=12345):
    udp_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Bind to the port on all interfaces ('' means all available interfaces)
    udp_sock.bind(('', port))

    result_queue = queue.Queue()


    # Start the listener thread so it can call our callback when data is received
    listener_thread = threading.Thread(target=udp_listener, args=(udp_sock, result_queue), daemon=True)
    listener_thread.start()

    # Send our command over UDP

    packet = {
        "_type": "id_request",
        "id": "PUPPET_01",
        "ip": get_my_ip_address(),
    }

    command = json.dumps(packet)
    udp_sock.sendto(command.encode(), (host, port))

    # print(f"Sent: {command.strip()} to {host}")

    start_time = time.time()
    listener_thread.join()

    data, addr = result_queue.get_nowait()
    return json.loads(data)

def get_my_ip_address():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # Connect to a public IP address (8.8.8.8 is Google's DNS) on any port.
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
    except Exception:
        ip = "127.0.0.1"
    finally:
        s.close()
    return ip


def send_msg_to_head(packet, host='192.168.4.1', port=12345):
    udp_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_sock.bind(('', port))
    command = json.dumps(packet)
    udp_sock.sendto(command.encode(), (host, port))
    return
