from keras.datasets import imdb
import torch
import torch.nn as nn
import torch.autograd as autograd
import torch.optim as optim
import torch.nn.functional as F
import numpy as np

class LSTM_MODEL(nn.Module):
    def __init__(self, hidden_dim, embedding_dim):
        super(LSTM_MODEL, self).__init__()
        self.hidden_dim = hidden_dim
        self.embedding_layer = nn.Embedding(5000, embedding_dim)
        self.lstm_layer = nn.LSTM( embedding_dim, hidden_dim )
        self.linear_layer = nn.Linear( hidden_dim, 2)
    def forward(self,inputs, hidden):
        x = self.embedding_layer(inputs).view(len(inputs),1,-1)
        lstm_out, lstm_hidden = self.lstm_layer(x, hidden)
        lstm_last_out = lstm_out[-1]
        predicted = self.linear_layer(lstm_last_out)
#        predicted = F.log_softmax(hidden2linear)
        return predicted, lstm_hidden
    def init_hidden(self):
        return ( autograd.Variable(torch.zeros(1,1,self.hidden_dim)),
                 autograd.Variable(torch.zeros(1,1,self.hidden_dim)))

if __name__ == "__main__":


    (X_train, y_train), (X_test, y_test) = imdb.load_data(num_words=5000,
                                                          maxlen=300)

    lstm_imdb = LSTM_MODEL(hidden_dim=100,embedding_dim=50)

    loss_function = nn.CrossEntropyLoss()
    optimizer = optim.Adam( lstm_imdb.parameters(), lr=1e-3)

    epochs = 10

    for i in range(epochs):
        loss_average = 0.0
        for index, data_entry in enumerate(X_train):
            data_entry = np.array( data_entry )
            data_entry = data_entry.astype(np.int32)
            data_entry = [ a.item() for a in data_entry ]
            y = y_train[index].item()

            input_sequence = autograd.Variable(torch.LongTensor(data_entry))
            y = autograd.Variable(torch.LongTensor([y]))
            hidden = lstm_imdb.init_hidden()
            y_pred, _ = lstm_imdb(input_sequence, hidden)
            lstm_imdb.zero_grad()
            loss = loss_function(y_pred, y)
            loss_average += loss.data[0]
            if index % 100 == 0:
                print( "epoch: %d iteration: %d loss: %g" %(i, index, loss.data[0]))
            loss.backward()
            optimizer.step()
        print( "Average loss: ", (loss_average/len(X_train)))
