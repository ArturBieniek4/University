#ifndef BST_HPP
#define BST_HPP
#include <bits/stdc++.h>

using namespace std;

template <typename T> class por {
    public:
        static bool eq (T a, T b) { return a == b; }
        static bool lt (T a, T b) { return a < b; }
};

template <typename T> class por2 {
    public:
        static bool eq (T a, T b) { return a == b; }
        static bool lt (T a, T b) { return a > b; }
};

template <typename T, typename C = less<T>> class bst
{
    private:
        class Node
        {
            public:
                T data;
                Node* left;
                Node* right;
                Node(const T& val) : data(val), left(nullptr), right(nullptr) {};
                Node(const Node& src);
                Node* remove(const T& val)
                {
                    if(data==val)
                    {
                        if(left==nullptr && right==nullptr)
                        {
                            delete this;
                            return nullptr;
                        } 
                        if(left==nullptr) return right;
                        if(right==nullptr) return left;
                        Node* current = right;
                        while(current && current->left != nullptr)
                            current = current->left;
                        data = current->data;
                        right = right->remove(data);
                        return this;
                    }
                    else
                    {
                        if(left!=nullptr) left=left->remove(val);
                        if(right!=nullptr) right=right->remove(val);
                        return this;
                    }
                }
                friend std::ostream& operator<<(std::ostream& os, const Node& node) {
                    if(node.left != nullptr) os<<*(node.left)<<" ";
                    os << node.data<<" ";
                    if(node.right != nullptr) os<<*(node.right);
                    return os;
                }
                ~Node();
        };
        Node *root;
    public:
        bst() : root(nullptr) {};
        bst(initializer_list<T> vals) : root(nullptr) {
            for(auto &s:vals) insert(s);
        };
        void insert(const T& val);
        void remove(const T& val);
        bool find(const T& val);
        bst(const bst& l);
        bst(bst&& l);
        const bst& operator=(const bst& w);
        const bst& operator=(bst&& w);
        friend ostream& operator << (ostream &wy, const bst &w)
        {
            if(w.root!=nullptr) wy<<(*(w.root));
            return wy;
        }
        ~bst();
};

#endif