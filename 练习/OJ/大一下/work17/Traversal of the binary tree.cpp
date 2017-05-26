#include <iostream>
#include <string>
using namespace std;

struct TREENODE
{
	struct TREENODE* left;
	struct TREENODE* right;
	char element;
};

TREENODE* CREATE_TREE(char* Inorder, char* Postorder, int length)
{
	if (length == 0)
		return NULL;
	
	TREENODE* node = new TREENODE;
	node -> element = Postorder[length - 1];

	int rootIndex = 0;
	for(; rootIndex < length; rootIndex++)
	{
		if (Inorder[rootIndex] == Postorder[length - 1])
			break;
	}

	cout << node -> element;
	node -> left = CREATE_TREE(Inorder, Postorder, rootIndex);
	node -> right = CREATE_TREE(Inorder + rootIndex + 1, Postorder + rootIndex, length - rootIndex - 1);

	return node;
}

int main()
{
	string Input_Inorder;
	cin >> Input_Inorder;
	char *Inorder = new char[Input_Inorder.length()];

	string Input_Postorder;
	cin >> Input_Postorder;
	char *Postorder = new char[Input_Postorder.length()];

	for (int i = 0; i < Input_Inorder.length(); ++i)
		Inorder[i] = Input_Inorder[i];
	for (int i = 0; i < Input_Postorder.length(); ++i)
		Postorder[i] = Input_Postorder[i];

	CREATE_TREE(Inorder, Postorder,Input_Inorder.length());

	cout << endl;


	return 0;
}