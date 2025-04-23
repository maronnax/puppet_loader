import serial
import threading
from collections import deque

class SerialReader:
    def __init__(self, port, baud=115200, timeout=1):
        self.history = deque(maxlen=50000)
        self._serial = serial.Serial(port, baudrate=baud, timeout=timeout)
        self._stop_event = threading.Event()
        self._thread = None
        return

    def _reader_loop(self):
        while not self._stop_event.is_set():
            try:
                line = self._serial.readline().decode('utf-8', errors='replace').strip()
                if line:
                    self.history.append(line)
            except Exception as e:
                print(f"Serial read error: {e}")
                break
        #print("Serial reader thread exiting.")
        return

    def start(self):
        if self._thread and self._thread.is_alive():
            print("Reader already running.")
            return
        self.history.clear()
        self._stop_event.clear()
        self._thread = threading.Thread(target=self._reader_loop, daemon=True)
        self._thread.start()
        # print("Serial reader started.")
        return

    def stop(self):
        if not self._thread:
            print("No reader thread to stop.")
            return
        self._stop_event.set()
        self._thread.join()
        # print("Serial reader stopped.")
        return

    def close(self):
        self.stop()
        self._serial.close()
        # print("Serial port closed.")
        return
