#include <stdlib.h>
#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <sstream>
#include <algorithm>
#include <map>

class Fragment
{
public:

    int _index;
    std::string _text;

    Fragment( int index, std::string text ):_index(index), _text(text)
    {}

    bool operator<(const Fragment& other)
    {
        return _index < other._index;
    }
};

class Package
{
public:
    int _id;
    int _size;
    std::vector<Fragment*> _fragments;

    Package( int id, int size, int index, std::string text )
            : _id(id), _size(size)
    {
        _fragments.emplace_back(new Fragment(index, text));
    }

    bool operator<(const Package& other)
    {
        return _id < other._id;
    }

    void addFragment(int index, std::string text)
    {
        _fragments.emplace_back(new Fragment(index, text));
    }

    bool isPackageComplete(){
        return _size - _fragments.size() == 0;
    }
};

/**
 * \brief Given two pointers lhs and rhs it returns true if
 *        rhs greater than lhs
 * \details Used to order objects
 *
 * \tparam T Class type
 */
template<class T>
struct sort_by_pointer {
    bool operator() (T* lhs, T* rhs) const
    {
        return (*lhs < *rhs);
    }
};

/**
 * \brief Read the input file
 * \details Reads a stream of characters from a file
 */
void readInput( std::map<int, Package*>  & dataStream )
{
    std::string line;
    int input_id;
    int input_size;
    int input_index;
    std::string input_text;

    while (std::getline(std::cin, line))
    {
        std::stringstream linInput(line);
        // Read from line
        linInput >> input_id >>
                    input_index >>
                    input_size ;
        std::getline(linInput, input_text);

        if ( dataStream.find(input_id) == dataStream.end() )
        {
            dataStream.emplace( input_id , new Package ( input_id,
                                                         input_size,
                                                         input_index,
                                                         input_text));
        }
        else
        {
            dataStream[input_id]->addFragment(input_index, input_text);
        }
    }
}

/**
 * \brief Prints to the std output the complete packages
 * \details Prints to the std output the result
 *
 * \param dataStream hasmap with the Package and it's id
 */
void printPackages( const std::map<int, Package*>  & dataStream)
{
    for(auto key: dataStream)
    {
        for(auto tmp: key.second->_fragments)
        {
            if(key.second->isPackageComplete())
            {
                    std::cout << key.second->_id << " "
                          << tmp->_index << " "
                          << key.second->_size << " "
                          << tmp->_text << std::endl;
            }
        }
    }
}

/**
 * \brief Sorts the fragments inside every package
 *
 * \param dataStream hasmap with all the packages
 */
void sortData( std::map<int, Package*>  & dataStream)
{
    for(auto key: dataStream)
    {
        std::sort(key.second->_fragments.begin(), key.second->_fragments.end(), sort_by_pointer<Fragment>());
    }
}


int main()
{
    std::map<int, Package*> dataStream;
    readInput(dataStream);
    sortData(dataStream);
    printPackages(dataStream);
    return 0;
}