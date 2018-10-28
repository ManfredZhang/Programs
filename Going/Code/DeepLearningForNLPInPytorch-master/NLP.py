
# coding: utf-8

# # Deep Learning for Natural Language Processing with Pytorch
#Robert https://github.com/rguthrie3/DeepLearningForNLPInPytorch

import torch
import torch.autograd as autograd
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

torch.manual_seed(1234)

# Create a torch.Tensor object with the given data.  It is a 1D vector
V_data = [1., 2., 3.]
V = torch.Tensor(V_data)
print (V)

# Creates a matrix
M_data = [[1., 2., 3.], [4., 5., 6]]
M = torch.Tensor(M_data)
print (M)

# Create a 3D tensor of size 2x2x2.
T_data = [[[1.,2.], [3.,4.]],
          [[5.,6.], [7.,8.]]]
T = torch.Tensor(T_data)
print (T)



# Index into V and get a scalar
print (V[0] )

# Index into M and get a vector
print (M[0] )

# Index into T and get a matrix
print (T[0])


x = torch.randn((3, 4, 5))
print( x )



x = torch.Tensor([ 1., 2., 3. ])
y = torch.Tensor([ 4., 5., 6. ])
z = x + y
print (z)

# By default, it concatenates along the first axis (concatenates rows)
x_1 = torch.randn(2, 5)
y_1 = torch.randn(3, 5)
z_1 =torch.cat([x_1, y_1])
print (z_1)

# Concatenate columns:
x_2 = torch.randn(2, 3)
y_2 = torch.randn(2, 5)
z_2 = torch.cat([x_2, y_2], 1) # second arg specifies which axis to concat along
print (z_2)


x = torch.randn(2, 3, 4)
print (x)
print (x.view(2, 12)) # Reshape to 2 rows, 12 columns
print (x.view(2, -1)) # Same as above.  If one of the dimensions is -1, its size can be inferred



# Variables wrap tensor objects
x = autograd.Variable( torch.Tensor([1., 2., 3]), requires_grad=True )
# You can access the data with the .data attribute
print (x.data )

# You can also do all the same operations you did with tensors with Variables.
y = autograd.Variable( torch.Tensor([4., 5., 6]), requires_grad=True )
z = x + y
print (z.data )

# BUT z knows something extra.
print( z.grad_fn )



# Lets sum up all the entries in z
s = z.sum()
print( s )
print (s.grad_fn   )


s.backward() # calling .backward() on any variable will run backprop, starting from it.
print (x.grad )


# Understanding what is going on in the block below is crucial for being a successful programmer in deep learning.

# In[4]:


x = torch.randn((2,2))
y = torch.randn((2,2))
z = x + y # These are Tensor types, and backprop would not be possible

var_x = autograd.Variable( x )
var_y = autograd.Variable( y )
var_z = var_x + var_y # var_z contains enough information to compute gradients, as we saw above
print (var_z.grad_fn)

var_z_data = var_z.data # Get the wrapped Tensor object out of var_z...
new_var_z = autograd.Variable( var_z_data ) # Re-wrap the tensor in a new variable

# ... does new_var_z have information to backprop to x and y?
# NO!
print (new_var_z.grad_fn)



lin = nn.Linear(5, 3) # maps from R^5 to R^3, parameters A, b
data = autograd.Variable( torch.randn(2, 5) ) # data is 2x5.  A maps from 5 to 3... can we map "data" under A?
print (lin(data)) # yes


data = autograd.Variable( torch.randn(2, 2) )
print (data )
print (F.relu(data))


# Softmax is also in torch.functional
data = autograd.Variable( torch.randn(5) )
print (data )
print (F.softmax(data) )
print (F.softmax(data).sum()) # Sums to 1 because it is a distribution!
print (F.log_softmax(data)) # theres also log_softmax



data = [ ("me gusta comer en la cafeteria".split(), "SPANISH"),
         ("Give it to me".split(), "ENGLISH"),
         ("No creo que sea una buena idea".split(), "SPANISH"),
         ("No it is not a good idea to get lost at sea".split(), "ENGLISH") ]

test_data = [ ("Yo creo que si".split(), "SPANISH"),
              ("it is lost on me".split(), "ENGLISH")]

# word_to_ix maps each word in the vocab to a unique integer, which will be its
# index into the Bag of words vector
word_to_ix = {}
for sent, _ in data + test_data:
    for word in sent:
        if word not in word_to_ix:
            word_to_ix[word] = len(word_to_ix)
print (word_to_ix )

VOCAB_SIZE = len(word_to_ix)
NUM_LABELS = 2


# In[17]:


class BoWClassifier(nn.Module): # inheriting from nn.Module!
    
    def __init__(self, num_labels, vocab_size):
        # calls the init function of nn.Module.  Dont get confused by syntax,
        # just always do it in an nn.Module
        super(BoWClassifier, self).__init__()
        
        self.linear = nn.Linear(vocab_size, num_labels)
        
        # NOTE! The non-linearity log softmax does not have parameters! So we don't need
        # to worry about that here
        
    def forward(self, bow_vec):
        # Pass the input through the linear layer,
        # then pass that through log_softmax.
        # Many non-linearities and other functions are in torch.nn.functional
        return F.log_softmax(self.linear(bow_vec))


# In[18]:


def make_bow_vector(sentence, word_to_ix):
    vec = torch.zeros(len(word_to_ix))
    for word in sentence:
        vec[word_to_ix[word]] += 1
    return vec.view(1, -1)

def make_target(label, label_to_ix):
    return torch.LongTensor([label_to_ix[label]])


# In[19]:


model = BoWClassifier(NUM_LABELS, VOCAB_SIZE)

for param in model.parameters():
    print( param )


# In[20]:


# To run the model, pass in a BoW vector, but wrapped in an autograd.Variable
sample = data[0]
bow_vector = make_bow_vector(sample[0], word_to_ix)
log_probs = model(autograd.Variable(bow_vector))
print( log_probs  )




label_to_ix = { "SPANISH": 0, "ENGLISH": 1 }


# Run on test data before we train, just to see a before-and-after
for instance, label in test_data:
    bow_vec = autograd.Variable(make_bow_vector(instance, word_to_ix))
    log_probs = model(bow_vec)
    print (log_probs)
#print (next(model.parameters())[:,word_to_ix["creo"]]) # Print the matrix column corresponding to "creo"


# In[23]:


loss_function = nn.NLLLoss()
optimizer = optim.SGD(model.parameters(), lr=0.1)

import numpy as np

for epoch in np.arange(100):
    for instance, label in data:
        model.zero_grad()         
        bow_vec = autograd.Variable(make_bow_vector(instance, word_to_ix))
        target = autograd.Variable(make_target(label, label_to_ix))
        log_probs = model(bow_vec)
        loss = loss_function(log_probs, target)
        loss.backward()
        optimizer.step()


# In[24]:


for instance, label in test_data:
    bow_vec = autograd.Variable(make_bow_vector(instance, word_to_ix))
    log_probs = model(bow_vec)
    print (log_probs)
#print (next(model.parameters())[:,word_to_ix["creo"]]) # Index corresponding to Spanish goes up, English goes down!



word_to_ix = { "hello": 0, "world": 1 }
embeds = nn.Embedding(2, 5) # 2 words in vocab, 5 dimensional embeddings
lookup_tensor = torch.LongTensor([word_to_ix["hello"]])
hello_embed = embeds( autograd.Variable(lookup_tensor) )
print (hello_embed )



CONTEXT_SIZE = 2
EMBEDDING_DIM = 10
# We will use Shakespeare Sonnet 2
test_sentence = """When forty winters shall besiege thy brow,
And dig deep trenches in thy beauty's field,
Thy youth's proud livery so gazed on now,
Will be a totter'd weed of small worth held:
Then being asked, where all thy beauty lies,
Where all the treasure of thy lusty days;
To say, within thine own deep sunken eyes,
Were an all-eating shame, and thriftless praise.
How much more praise deserv'd thy beauty's use,
If thou couldst answer 'This fair child of mine
Shall sum my count, and make my old excuse,'
Proving his beauty by succession thine!
This were to be new made when thou art old,
And see thy blood warm when thou feel'st it cold.""".split()
# we should tokenize the input, but we will ignore that for now
# build a list of tuples.  Each tuple is ([ word_i-2, word_i-1 ], target word)
trigrams = [ ([test_sentence[i], test_sentence[i+1]], test_sentence[i+2]) for i in np.arange(len(test_sentence) - 2) ]
print (trigrams[:3]) # print the first 3, just so you can see what they look like




vocab = set(test_sentence)
word_to_ix = { word: i for i, word in enumerate(vocab) }



class NGramLanguageModeler(nn.Module):
    
    def __init__(self, vocab_size, embedding_dim, context_size):
        super(NGramLanguageModeler, self).__init__()
        self.embeddings = nn.Embedding(vocab_size, embedding_dim)
        self.linear1 = nn.Linear(context_size * embedding_dim, 128)
        self.linear2 = nn.Linear(128, vocab_size)
        
    def forward(self, inputs):
        embeds = self.embeddings(inputs)
        embeds = embeds.view((1, -1))
        out = F.relu(self.linear1(embeds))
        out = self.linear2(out)
        log_probs = F.log_softmax(out)
        return log_probs


# In[29]:


losses = []
loss_function = nn.NLLLoss()
model = NGramLanguageModeler(len(vocab), EMBEDDING_DIM, CONTEXT_SIZE)
optimizer = optim.SGD(model.parameters(), lr=0.001)

for epoch in np.arange(10):
    total_loss = torch.Tensor([0])
    for context, target in trigrams:
    
        # Step 1. Prepare the inputs to be passed to the model (i.e, turn the words
        # into integer indices and wrap them in variables)
        context_idxs = list(map(lambda w: word_to_ix[w], context))
        context_var = autograd.Variable( torch.LongTensor(context_idxs) )
    
        # Step 2. Recall that torch *accumulates* gradients.  Before passing in a new instance,
        # you need to zero out the gradients from the old instance
        model.zero_grad()
    
        # Step 3. Run the forward pass, getting log probabilities over next words
        log_probs = model(context_var)
    
        # Step 4. Compute your loss function. (Again, Torch wants the target word wrapped in a variable)
        loss = loss_function(log_probs, autograd.Variable(torch.LongTensor([word_to_ix[target]])))
    
        # Step 5. Do the backward pass and update the gradient
        loss.backward()
        optimizer.step()
        print("loss:{}".format(loss.data))
        total_loss += loss.data
    losses.append(total_loss)
print (losses) # The loss decreased every iteration over the training data!

CONTEXT_SIZE = 2 # 2 words to the left, 2 to the right
raw_text = """We are about to study the idea of a computational process. Computational processes are abstract
beings that inhabit computers. As they evolve, processes manipulate other abstract
things called data. The evolution of a process is directed by a pattern of rules
called a program. People create programs to direct processes. In effect,
we conjure the spirits of the computer with our spells.""".split()
word_to_ix = { word: i for i, word in enumerate(set(raw_text)) }
data = []
for i in np.arange(2, len(raw_text) - 2):
    context = [ raw_text[i-2], raw_text[i-1], raw_text[i+1], raw_text[i+2] ]
    target = raw_text[i]
    data.append( (context, target) )
print (data[:5])



# create your model and train.  here are some functions to help you make the data ready for use by your module
def make_context_vector(context, word_to_ix):
    idxs = list(map(lambda w: word_to_ix[w], context))
    tensor = torch.LongTensor(idxs)
    return autograd.Variable(tensor)

make_context_vector(data[0][0], word_to_ix) # example

lstm = nn.LSTM(3, 3) # Input dim is 3, output dim is 3
inputs = [ autograd.Variable(torch.randn((1,3))) for _ in np.arange(5) ] # make a sequence of length 5

# initialize the hidden state.  
hidden = (autograd.Variable(torch.randn(1,1,3)), autograd.Variable(torch.randn((1,1,3))))
for i in inputs:
   
    out, hidden = lstm(i.view(1,1,-1), hidden)

inputs = torch.cat(inputs).view(len(inputs), 1, -1) # Add the extra 2nd dimension
hidden = (autograd.Variable(torch.randn(1,1,3)), autograd.Variable(torch.randn((1,1,3)))) # clean out hidden state
out, hidden = lstm(inputs, hidden)
print (out)
print (hidden)

def prepare_sequence(seq, to_ix):
    idxs = list(map(lambda w: to_ix[w], seq))
    tensor = torch.LongTensor(idxs)
    return autograd.Variable(tensor)


# In[35]:


training_data = [
    ("The dog ate the apple".split(), ["DET", "NN", "V", "DET", "NN"]),
    ("Everybody read that book".split(), ["NN", "V", "DET", "NN"])
]
word_to_ix = {}
for sent, tags in training_data:
    for word in sent:
        if word not in word_to_ix:
            word_to_ix[word] = len(word_to_ix)
print (word_to_ix)
tag_to_ix = {"DET": 0, "NN": 1, "V": 2}


EMBEDDING_DIM = 6
HIDDEN_DIM = 6



class LSTMTagger(nn.Module):
    
    def __init__(self, embedding_dim, hidden_dim, vocab_size, tagset_size):
        super(LSTMTagger, self).__init__()
        self.hidden_dim = hidden_dim
        
        self.word_embeddings = nn.Embedding(vocab_size, embedding_dim)
        
        # The LSTM takes word embeddings as inputs, and outputs hidden states
        # with dimensionality hidden_dim.
        self.lstm = nn.LSTM(embedding_dim, hidden_dim)
        
        # The linear layer that maps from hidden state space to tag space
        self.hidden2tag = nn.Linear(hidden_dim, tagset_size)
        self.hidden = self.init_hidden()
        
    def init_hidden(self):
        # Before we've done anything, we dont have any hidden state.
        # Refer to the Pytorch documentation to see exactly why they have this dimensionality.
        # The axes semantics are (num_layers, minibatch_size, hidden_dim)
        return (autograd.Variable(torch.zeros(1, 1, self.hidden_dim)),
                autograd.Variable(torch.zeros(1, 1, self.hidden_dim)))
        
    def forward(self, sentence):
        embeds = self.word_embeddings(sentence)
        lstm_out, self.hidden = self.lstm(embeds.view(len(sentence), 1, -1), self.hidden)
        tag_space = self.hidden2tag(lstm_out.view(len(sentence), -1))
        tag_scores = F.log_softmax(tag_space)
        return tag_scores


# In[37]:


model = LSTMTagger(EMBEDDING_DIM, HIDDEN_DIM, len(word_to_ix), len(tag_to_ix))
loss_function = nn.NLLLoss()
optimizer = optim.SGD(model.parameters(), lr=0.1)


inputs = prepare_sequence(training_data[0][0], word_to_ix)
tag_scores = model(inputs)
print (tag_scores)


# In[39]:


for epoch in np.arange(300): # again, normally you would NOT do 300 epochs, it is toy data
    for sentence, tags in training_data:
        # Step 1. Remember that Pytorch accumulates gradients.  We need to clear them out
        # before each instance
        model.zero_grad()
        
        # Also, we need to clear out the hidden state of the LSTM, detaching it from its
        # history on the last instance.
        model.hidden = model.init_hidden()
    
        # Step 2. Get our inputs ready for the network, that is, turn them into Variables
        # of word indices.
        sentence_in = prepare_sequence(sentence, word_to_ix)
        targets = prepare_sequence(tags, tag_to_ix)
    
        # Step 3. Run our forward pass.
        tag_scores = model(sentence_in)
    
        # Step 4. Compute the loss, gradients, and update the parameters by calling
        # optimizer.step()
        loss = loss_function(tag_scores, targets)
        loss.backward()
        optimizer.step()


# In[40]:


# See what the scores are after training
inputs = prepare_sequence(training_data[0][0], word_to_ix)
tag_scores = model(inputs)
print (tag_scores)


# Helper functions to make the code more readable.
def to_scalar(var):
    # returns a python float
    return var.view(-1).data.tolist()[0]

def argmax(vec):
    # return the argmax as a python int
    _, idx = torch.max(vec, 1)
    return to_scalar(idx)

# Compute log sum exp in a numerically stable way for the forward algorithm
def log_sum_exp(vec):
    max_score = vec[0, argmax(vec)]
    max_score_broadcast = max_score.view(1, -1).expand(1, vec.size()[1])
    return max_score + torch.log(torch.sum(torch.exp(vec - max_score_broadcast)))
    

class BiLSTM_CRF(nn.Module):
    
    def __init__(self, vocab_size, tag_to_ix, embedding_dim, hidden_dim):
        super(BiLSTM_CRF, self).__init__()
        self.embedding_dim = embedding_dim
        self.hidden_dim = hidden_dim
        self.vocab_size = vocab_size
        self.tag_to_ix = tag_to_ix
        self.tagset_size = len(tag_to_ix)
        
        self.word_embeds = nn.Embedding(vocab_size, embedding_dim)
        self.lstm = nn.LSTM(input_size=embedding_dim, hidden_size=hidden_dim//2, num_layers=1, bidirectional=True)
        
        # Maps the output of the LSTM into tag space.
        self.hidden2tag = nn.Linear(hidden_dim, self.tagset_size)
        
        # Matrix of transition parameters.  Entry i,j is the score of transitioning *to* i *from* j.
        self.transitions = nn.Parameter(torch.randn(self.tagset_size, self.tagset_size))
        
        # These two statements enforce the constraint that we never transfer *to* the start tag,
        # and we never transfer *from* the stop tag (the model would probably learn this anyway,
        # so this enforcement is likely unimportant)
        self.transitions.data[tag_to_ix[START_TAG], :] = -10000
        self.transitions.data[:, tag_to_ix[STOP_TAG]] = -10000
        
        self.hidden = self.init_hidden()
        
    def init_hidden(self):
        return ( autograd.Variable( torch.randn(2, 1, self.hidden_dim)),
                 autograd.Variable( torch.randn(2, 1, self.hidden_dim)) )
    
    
    def _forward_alg(self, feats):
        # Do the forward algorithm to compute the partition function
        init_alphas = torch.Tensor(1, self.tagset_size).fill_(-10000.)
        # START_TAG has all of the score.
        init_alphas[0][self.tag_to_ix[START_TAG]] = 0.
        
        # Wrap in a variable so that we will get automatic backprop
        forward_var = autograd.Variable(init_alphas)
        
        # Iterate through the sentence
        for feat in feats:
            alphas_t = [] # The forward variables at this timestep
            for next_tag in np.arange(self.tagset_size):
                # broadcast the emission score: it is the same regardless of the previous tag
                emit_score = feat[next_tag].view(1, -1).expand(1, self.tagset_size)
                # the ith entry of trans_score is the score of transitioning to next_tag from i
                trans_score = self.transitions[next_tag].view(1, -1)
                # The ith entry of next_tag_var is the value for the edge (i -> next_tag)
                # before we do log-sum-exp
                next_tag_var = forward_var + trans_score + emit_score
                # The forward variable for this tag is log-sum-exp of all the scores.
                alphas_t.append(log_sum_exp(next_tag_var))
            forward_var = torch.cat(alphas_t).view(1, -1)
        terminal_var = forward_var + self.transitions[self.tag_to_ix[STOP_TAG]]
        alpha = log_sum_exp(terminal_var)
        return alpha
        
    def _get_lstm_features(self, sentence):
        self.hidden = self.init_hidden()
        embeds = self.word_embeds(sentence).view(len(sentence), 1, -1)
        lstm_out, self.hidden = self.lstm(embeds)
        lstm_out = lstm_out.view(len(sentence), self.hidden_dim)
        lstm_feats = self.hidden2tag(lstm_out)
        return lstm_feats
        
    def _score_sentence(self, feats, tags):
        # Gives the score of a provided tag sequence
        score = autograd.Variable( torch.Tensor([0]) )
        tags = torch.cat( [torch.LongTensor([self.tag_to_ix[START_TAG]]), tags] )
        for i, feat in enumerate(feats):
            score = score + self.transitions[tags[i+1], tags[i]] + feat[tags[i+1]]
        score = score + self.transitions[self.tag_to_ix[STOP_TAG], tags[-1]]
        return score
    
    def _viterbi_decode(self, feats):
        backpointers = []
        
        # Initialize the viterbi variables in log space
        init_vvars = torch.Tensor(1, self.tagset_size).fill_(-10000.)
        init_vvars[0][self.tag_to_ix[START_TAG]] = 0
        
        # forward_var at step i holds the viterbi variables for step i-1 
        forward_var = autograd.Variable(init_vvars)
        for feat in feats:
            bptrs_t = [] # holds the backpointers for this step
            viterbivars_t = [] # holds the viterbi variables for this step
            
            for next_tag in range(self.tagset_size):
                # next_tag_var[i] holds the viterbi variable for tag i at the previous step,
                # plus the score of transitioning from tag i to next_tag.
                # We don't include the emission scores here because the max
                # does not depend on them (we add them in below)
                next_tag_var = forward_var + self.transitions[next_tag]
                best_tag_id = argmax(next_tag_var)
                bptrs_t.append(best_tag_id)
                viterbivars_t.append(next_tag_var[0][best_tag_id])
            # Now add in the emission scores, and assign forward_var to the set
            # of viterbi variables we just computed
            forward_var = (torch.cat(viterbivars_t) + feat).view(1, -1)
            backpointers.append(bptrs_t)
        
        # Transition to STOP_TAG
        terminal_var = forward_var + self.transitions[self.tag_to_ix[STOP_TAG]]
        best_tag_id = argmax(terminal_var)
        path_score = terminal_var[0][best_tag_id]
        
        # Follow the back pointers to decode the best path.
        best_path = [best_tag_id]
        for bptrs_t in reversed(backpointers):
            best_tag_id = bptrs_t[best_tag_id]
            best_path.append(best_tag_id)
        # Pop off the start tag (we dont want to return that to the caller)
        start = best_path.pop()
        assert start == self.tag_to_ix[START_TAG] # Sanity check
        best_path.reverse()
        return path_score, best_path
        
    def neg_log_likelihood(self, sentence, tags):
        self.hidden = self.init_hidden()
        feats = self._get_lstm_features(sentence)
        forward_score = self._forward_alg(feats)
        gold_score = self._score_sentence(feats, tags)
        return forward_score - gold_score
        
    def forward(self, sentence): # dont confuse this with _forward_alg above.
        self.hidden = self.init_hidden()
        # Get the emission scores from the BiLSTM
        lstm_feats = self._get_lstm_features(sentence)
        
        # Find the best path, given the features.
        score, tag_seq = self._viterbi_decode(lstm_feats)
        return score, tag_seq




START_TAG = "<START>"
STOP_TAG = "<STOP>"
EMBEDDING_DIM = 5
HIDDEN_DIM = 4

# Make up some training data
training_data = [ (
    "the wall street journal reported today that apple corporation made money".split(),
    "B I I I O O O B I O O".split()
), (
    "georgia tech is a university in georgia".split(),
    "B I O O O O B".split()
) ]

word_to_ix = {}
for sentence, tags in training_data:
    for word in sentence:
        if word not in word_to_ix:
            word_to_ix[word] = len(word_to_ix)
            
tag_to_ix = { "B": 0, "I": 1, "O": 2, START_TAG: 3, STOP_TAG: 4 }


# In[49]:


model = BiLSTM_CRF(len(word_to_ix), tag_to_ix, EMBEDDING_DIM, HIDDEN_DIM)
optimizer = optim.SGD(model.parameters(), lr=0.01, weight_decay=1e-4)


# In[50]:


# Check predictions before training
precheck_sent = prepare_sequence(training_data[0][0], word_to_ix)
precheck_tags = torch.LongTensor([ tag_to_ix[t] for t in training_data[0][1] ])
print (model(precheck_sent))


# In[51]:


# Make sure prepare_sequence from earlier in the LSTM section is loaded
for epoch in np.arange(300): # again, normally you would NOT do 300 epochs, it is toy data
    for sentence, tags in training_data:
        # Step 1. Remember that Pytorch accumulates gradients.  We need to clear them out
        # before each instance
        model.zero_grad()
    
        # Step 2. Get our inputs ready for the network, that is, turn them into Variables
        # of word indices.
        sentence_in = prepare_sequence(sentence, word_to_ix)
        targets = torch.LongTensor([ tag_to_ix[t] for t in tags ])
    
        # Step 3. Run our forward pass.
        neg_log_likelihood = model.neg_log_likelihood(sentence_in, targets)
    
        # Step 4. Compute the loss, gradients, and update the parameters by calling
        # optimizer.step()
        neg_log_likelihood.backward()
        optimizer.step()


# In[52]:


# Check predictions after training
precheck_sent = prepare_sequence(training_data[0][0], word_to_ix)
print (model(precheck_sent))
