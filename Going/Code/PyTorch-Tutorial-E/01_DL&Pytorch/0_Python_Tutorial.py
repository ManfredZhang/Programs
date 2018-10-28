
# coding: utf-8

# # Python Tutorial
# 
# - Hello World!
# - Variables and Types
# - Arithmetic Operations
# - List
# - Dictionary
# - Loop
# - Condition
# - Function
# - Class and Objects
# 
# ## 1. Hello World!

# In[1]:


print("Hello World!")


# ## 2. Variables and Types

# In[2]:


a = 2
print(a,type(a),end="\n\n")

b = 2.0
print(b,type(b),end="\n\n")

c = "Pytorch"
print(c,type(c),end="\n\n")

d = a+b
print(d,type(d),end="\n\n")

e = str(a)+" "+c
print(e,type(e),end="\n\n")


# ## 3. Arithmetic Operations

# In[3]:


a=1
b=2
c=3

print(a+b)
print(a-b)
print(b*c)
print(b/c)
print(c//b)
print(b**c)


# ## 4. List

# In[4]:


list_1 = [1,2,3]
print(list_1)

list_1.append(4)
print(list_1)

list_1.append("abc")
print(list_1)

# index
print(list_1[:-1])

del list_1[-1]
print(list_1)

list_1.pop()
print(list_1)


# ## 5. Dictionary

# In[5]:


dict_1 = {
    "python": 0,
    "java":1,
    "c++":2,
    "ruby":3,
    "html":4,
    "key":"value",
}

print(dict_1)
print(dict_1["c++"])

del dict_1["key"]
print(dict_1)

dict_1["pytorch"]=5
print(dict_1)


# ## 6. Loop

# In[6]:


for i in range(5):
    print(i)

print("\n")
for i in range(0,-5,-1):
    print(i)


# In[7]:


print(list_1)
for i in list_1:
    print(i)

print("\n")
print(dict_1)
for key in dict_1:
    print(key,dict_1[key])


# In[15]:


a=0
while(a<10):
    print(a)
    a+=1


# ## 7. Condition

# In[9]:


print(2==2)
print(2==3)
print(2!=2)
print(2!=3)


# In[14]:


print(dict_1)
for key in dict_1:
    if key=="ruby":
        print(dict_1[key])
    else:
        print("not ruby")


# ## 8. Function

# In[26]:


def factorial(num):
    result = 1
    for i in range(1,num+1):
        result = result*i
    return result

print(factorial(5))


# ## 9. Class and Objects

# In[32]:


class Jedi(object):
    def __init__(self,name,droid):
        self.name = name
        self.droid = droid
        self.exp = 0
        
    def train(self):
        self.exp += 10

anakin = Jedi("Anakin Skywalker","R2D2")
anakin.train()

print(anakin.name)
print(anakin.droid)
print(anakin.exp)

