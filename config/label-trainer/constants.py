import torch

SEP_TOKEN = '[SEP]'
CLS_TOKEN = '[CLS]'
MODEL_FILE_PATH = '/share/model/model.pth'
BATCH_SIZE = 4
NUM_EPOCHS = 3
GRADIENT_ACCUMULATION_STEPS = 8
MAX_CLASS_SIZE = 200# float("inf") for all
DEVICE = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")