CPPC = c++
CPPFLAGS =  -Wall -Werror -Wextra 
STD = -std=c++98

REQUEST_SRC = $(filter-out request/main.cpp, $(wildcard request/*.cpp))
SRC = $(wildcard infrastructure/*.cpp) $(REQUEST_SRC) $(wildcard CGI_handling/*.cpp) main.cpp
HEADERS = $(wildcard includes/*.hpp)

OBJ = $(SRC:%.cpp=%.o)
TARGET = Main_server

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(CPPC) $(CPPFLAGS) $(STD) $(OBJ) -o $(TARGET)

%.o : %.cpp $(HEADERS)
	$(CPPC) $(CPPFLAGS) $(STD) -c $< -o $@

clean :
	rm -rf $(OBJ)

fclean : clean
	rm -rf  $(TARGET)

re : fclean all