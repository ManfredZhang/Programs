import torch
import torch.nn
import numpy as np

class ContrastiveLoss(torch.nn.Module):
    """
    Contrastive loss function.

    Based on:
    """

    def __init__(self, margin=1.0):
        super(ContrastiveLoss, self).__init__()
        self.margin = margin

    def forward(self, x0, x1, y):
        # euclidian distance
        diff = x0 - x1
        dist_sq = torch.sum(torch.pow(diff, 2), 1)
        dist = torch.sqrt(dist_sq)

        mdist = self.margin - dist
        dist = torch.clamp(mdist, min=0.0)
        loss = y * dist_sq + (1 - y) * torch.pow(dist, 2)
        loss = torch.sum(loss) / 2.0 / x0.size()[0]
        return loss

class K_ways_ContrastiveLoss(torch.nn.Module):
    """
    Contrastive loss function.

    Based on:
    """

    def __init__(self, margin=1.0, k_ways=5):
        super(K_ways_ContrastiveLoss, self).__init__()
        self.ContrastiveLoss=ContrastiveLoss(margin=margin)
        self.k_ways=k_ways

    def forward(self, x0, x1, y):
        loss=0.0
        for i in np.arange(self.k_ways):
            tmp = self.ContrastiveLoss(x0[i],x1[i],y[i])
            loss = loss+ tmp

        return loss