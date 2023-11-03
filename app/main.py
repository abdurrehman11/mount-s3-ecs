import os
from typing import Annotated, Union
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"health": "ok"}


@app.get("/items/{item_id}")
async def read_item():
    files = len(os.listdir("/home/data"))
    return {
        "status": "ok",
        "files": f"Total files # {files}",
    }
