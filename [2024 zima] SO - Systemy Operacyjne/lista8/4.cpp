#include <bits/stdc++.h>

#define FIRST_FIT false

using namespace std;

struct Block {
    int start;    // początkowy adres bloku
    int size;     // rozmiar bloku (łącznie z boundary tagami)
    bool free;    // czy blok jest wolny
    char id;      // identyfikator bloku (tylko dla zajętych)

    Block(int start, int size, bool free, char id = 'A')
        : start(start), size(size), free(free), id(id) {}
};

std::list<Block> memory;
int total_size;
char next_id='A';

void printMemory() {
        std::cout << "Stan pamięci:\n";
        for (const auto& block : memory) {
            std::cout << "[" << (block.free ? "wolny" : "blok ") << (block.free ? " " : std::string(1, block.id)) << "] ";
            std::cout << "start=" << block.start << " rozmiar=" << block.size << "\n";
        }
        std::cout << "\n";
    }

char alloc(long size)
{
	size+=2;
	auto best_fit = memory.end();
	for(auto it = memory.begin(); it!=memory.end(); it++)
	{
		if(it->free && it->size>=size)
		{
			best_fit = it;
			if(FIRST_FIT) break;
		}
		
	}

	if(best_fit==memory.end())
	{
		cerr<<"no memory for alloc("<<size<<")\n";
		return 0;
	}

	int size_left = best_fit->size - size;
	best_fit->free = false;
	best_fit->size = size;
	best_fit->id = next_id++;

	if(size_left > 0)
	{
		memory.insert(next(best_fit), Block(best_fit->start+size, size_left, true));
	}
	cout<<"alloc("<<size<<")=>"<<best_fit->id<<"\n";
	printMemory();
	return best_fit->id;
}

void free(char id) {
        auto it = std::find_if(memory.begin(), memory.end(), [id](const Block& block) {
            return block.id == id && !block.free;
        });

        if (it == memory.end()) {
            std::cout << "free(" << id << "): Nie znaleziono bloku\n";
            return;
        }

        it->free = true;
        it->id = '\0';
        std::cout << "free(" << id << "): Zwolniono blok\n";

        // Połącz z sąsiednimi wolnymi blokami
        if (it != memory.begin()) {
            auto prev = std::prev(it);
            if (prev->free) {
                prev->size += it->size;
                it = memory.erase(it);
                it = prev;
            }
        }

        auto next = std::next(it);
        if (next != memory.end() && next->free) {
            it->size += next->size;
            memory.erase(next);
        }
	printMemory();	
}

int main()
{
	memory.emplace_back(0, 50, true); // wolny blok rozmiaru 50
	alloc(4); alloc(8); alloc(4); alloc(4); alloc(10); alloc(6); free('C'); free('B'); free('F'); alloc(6); free('D'); alloc(18);
	return 0;
}
