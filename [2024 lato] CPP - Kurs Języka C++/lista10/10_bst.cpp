#include "10_bst.hpp"
#include <bits/stdc++.h>
using namespace std;

template<typename T, typename C> void bst<T, C>::insert(const T& val)
{
    Node *newnode = new Node(val);
    if(root==nullptr)
    {
        root=newnode;
        return;
    }
    Node *actnode = root;
    while(actnode!=nullptr)
    {
        if(C::lt(val, actnode->data))
        {
            if(actnode->left==nullptr)
            {
                actnode->left=newnode;
                return;
            }
            actnode=actnode->left;
        }
        else
        {
            if(actnode->right==nullptr)
            {
                actnode->right=newnode;
                return;
            }
            actnode=actnode->right;
        }
    }
}

template<typename T, typename C> bool bst<T, C>::find(const T& val)
{
    Node *actnode = root;
    while(actnode!=nullptr)
    {
        if(C::eq(val, actnode->data))
            return true;
        if(C::lt(val, actnode->data))
            actnode = actnode->left;
        else
            actnode = actnode->right;
    }
    return false;
}

template<typename T, typename C> bst<T, C>::bst(const bst& src)
{
    if(src==nullptr)
    {
        ~this();
        root = nullptr;
        return;
    }
    root = new Node(src);
}

template<typename T, typename C> bst<T, C>::Node::Node(const Node& src)
{
    if(src==nullptr) return;
    if(src->left == nullptr) left = nullptr;
    else left = new Node(src->left);
    if(src->right == nullptr) right = nullptr;
    else right = new Node(src->right);
}

template<typename T, typename C> const bst<T, C> &bst<T,C>::operator=(const bst& src) {
    if(src==nullptr)
    {
        ~this();
        return nullptr;
    }
    left = new Node(src->left);
    right = new Node(src->right);
    return *this;
}

template<typename T, typename C> bst<T, C>::bst(bst&& src)
{
    if(src==nullptr)
    {
        ~this();
        root = nullptr;
        return;
    }
    swap(src->left, left);
    swap(src->right, right);
    swap(src->data, data);
    return;
}

template<typename T, typename C> const bst<T, C> &bst<T,C>::operator=(bst&& src) {
    if(src==nullptr)
    {
        ~this();
        return nullptr;
    }
    swap(src->left, left);
    swap(src->right, right);
    swap(src->data, data);
    return *this;
}

template<typename T, typename C> bst<T, C>::Node::~Node()
{
    if(left!=nullptr) delete left;
    if(right!=nullptr) delete right;
}

template<typename T, typename C> bst<T, C>::~bst()
{
    delete root;
}

template<typename T, typename C> void bst<T, C>::remove(const T& val)
{
    if(root==nullptr)
    {
        return;
    }
    root=root->remove(val);
}

// template<typename T, typename C> bst<T, C>::Node* bst<T, C>::Node::remove(const T& val)
// {
    
// }
