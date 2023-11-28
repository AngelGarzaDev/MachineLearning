from transformers import pipeline

classifier = pipline("sentiment-analysis")

res = classifier ("I've been waiting for a HuggingFace course my whole life")

print(res)