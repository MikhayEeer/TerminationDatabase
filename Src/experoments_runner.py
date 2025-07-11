import psutil
import os
import time
from functools import wraps

class BasicRunner:
    @staticmethod
    def performance_monitor(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            process = psutil.Process(os.getpid())
            start_time = time.time()
            result = func(*args, **kwargs)
            end_time = time.time()
            cpu_usage = process.cpu_percent(interval=None)
            mem_usage = process.memory_info().rss / (1024 * 1024)
            print("\n--- Performance Metrics ---")
            print(f"  Function: '{func.__name__}'")
            print(f"  Execution Time: {end_time - start_time:.4f} seconds")
            print(f"  CPU Usage during execution: {cpu_usage}%")
            print(f"  Memory Usage (RSS): {mem_usage:.2f} MB")
            print("---------------------------\n")
            return result
        return wrapper
    
    # virtual func
    def batch_run(self, data):
        """
        This method should be overridden by subclasses to implement batch processing.
        """
        raise NotImplementedError("Subclasses should implement this method.")
    
    @performance_monitor
    def run(self, data):
        """
        Run the experiment with the provided data.
        This method can be overridden by subclasses to implement specific run logic.
        """
        print(f"Running experiment with data: {data}")
        return self.batch_run(data)

class ExperimentRunner(BasicRunner):
    def __init__(self, experiment_name):
        self.experiment_name = experiment_name
        print(f"Initialized ExperimentRunner for: {self.experiment_name}")

    def batch_run(self, data):
        """
        Example implementation of batch_run that processes the data.
        """
        pass

    def run(self, data):
        pass