#pragma once

#include <string>
#include <iostream>

#if __has_include(<filesystem>)
#include <filesystem>
namespace fs = std::filesystem;
#else
#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;
#endif

class Directory
{
public:
	static std::string GetCurrentDirectory()
	{
		return fs::current_path().u8string();
	}

	static bool Exists(const std::string& path)
	{
		return fs::exists(fs::path(path));
	}

	static void CreateDirectory(const std::string& path)
	{
		std::string curPath = "";
		std::vector<std::string> split = StringHelper::Split(path, "/");

		for (std::string s : split)
		{
			curPath += s + "/";

			if (!Exists(curPath))
				fs::create_directory(curPath);
		}

		//fs::create_directory(path);
	}
};
