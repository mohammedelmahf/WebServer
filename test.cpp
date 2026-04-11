#include <cstdio>
#include <fstream>
#include <iostream>
#include <string>
#include <sys/stat.h>

class ConfigFile
{
public:
	static int getTypePath(std::string const path)
	{
		struct stat buffer;
		int result;

		result = stat(path.c_str(), &buffer);
		if (result == 0)
		{
			if (buffer.st_mode & S_IFREG)
				return (1);
			else if (buffer.st_mode & S_IFDIR)
				return (2);
			else
				return (3);
		}
		else
			return (-1);
	}
};

static void runCase(const std::string &label, const std::string &path, int expected)
{
	int actual = ConfigFile::getTypePath(path);
	std::cout << actual << std::endl;
}

int main()
{
	std::cout << "Testing ConfigFile::getTypePath" << std::endl;
	runCase("Config file", "./ConfigFile.conf", 1);

	return 0;
}
