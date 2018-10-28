import numpy as np
import operator
import constants as c
from . import metric_utils


class Metric():
    def __init__(self, name, minimize=True):
        self.name = name
        self.minimize = minimize

    def get_best_epoch(self, values):
        if self.minimize:
            idx, value = min(enumerate(values),
                key=operator.itemgetter(1))
        else:
            idx, value = max(enumerate(values),
                key=operator.itemgetter(1))
        epoch = idx + 1 # epochs start at 1
        return epoch, value

    def evaluate(self, loss, preds, probs, targets):
        pass

    def format(self, value):
        pass


class AuxiliaryMetric():
    def __init__(self, name, units):
        self.name = name
        self.units = units


class Accuracy(Metric):
    def __init__(self):
        super().__init__(c.ACCURACY, minimize=False)

    def evaluate(self, loss, preds, probs, targets):
        return metric_utils.get_accuracy(preds, targets)

    def format(self, value):
        return value


class Loss(Metric):
    def __init__(self):
        super().__init__(c.LOSS, minimize=True)

    def evaluate(self, loss, preds, probs, targets):
        return loss

    def format(self, value):
        return value

