#include <iostream>
#include <string>

unsigned int randNum;

void printBanner() {
	std::cout << "			   ____                     __  __           _          \n			  / ___|_   _  ___  ___ ___|  \\/  | __ _ ___| |_ ___ _ __ \n			 | |  _| | | |/ _ \\/ __/ __| |\\/| |/ _` / __| __/ _ \\ '__|\n			 | |_| | |_| |  __/\\__ \\__ \\ |  | | (_| \\__ \\ ||  __/ |   \n			  \\____|\\__,_|\\___||___/___/_|  |_|\\__,_|___/\\__\\___|_|   ";
	std::cout << std::endl << std::endl;
}

int levelChoice() {
	std::string levelString;
	int level;

	std::cout << "Vyber uroven: " << std::endl;
	std::cout << "1. Lahka (1 - 10)" << std::endl;
	std::cout << "2. Stredna (1 - 100)" << std::endl;
	std::cout << "3. Tazka (1 - 1000)" << std::endl;
	std::cout << "4. Expert (1 - 10 000)" << std::endl;

	std::cout << "Vasa volba: ";
	std::cin >> levelString;

	if (levelString == "1") {
		return 1;
	} else if (levelString == "2") {
		return 2;
	} else if (levelString == "3") {
		return 3;
	} else if (levelString == "4") {
		return 4;
	} else {
		std::cerr << "Error zadaj cislo od 1 do 3" << std::endl;
		system("pause >> nul");
		exit(1);
	}
}

void lv(unsigned int levelNum) {
	system("cls");
	printBanner();
	std::cout << std::endl;

	if (levelNum == 1) {
		randNum = rand() % 10 + 1;
		system("color 2");
	} else if (levelNum == 2) {
		randNum = rand() % 100 + 1;
		system("color 6");
	} else if (levelNum == 3) {
		randNum = rand() % 1000 + 1;
		system("color 4");
	} else if (levelNum == 4) {
		randNum = rand() % 10000 + 1;
		system("color 5");
	}

	unsigned int guess;
	std::string guessStr;
	guess = 0;
	int i;
	for (i = 0; guess != randNum; i++) {
		std::cout << "Tvoj typ: ";
		std::cin >> guessStr;

		bool isNum = true;
		for (char c : guessStr) {
			if (!std::isdigit(c)) {
				isNum = false;
				break;
			}
		}

		if (!isNum) {
			std::cerr << "Error zadaj cislo";
			system("pause > nul");
			exit(0);
		}

		guess = std::stoi(guessStr);

		if (guess > randNum) {
			system("cls");
			printBanner();
			std::cout << "Menej" << std::endl;
		} else if (guess < randNum) {
			system("cls");
			printBanner();
			std::cout << "Viac" << std::endl;
		}
	}

	std::cout << "Spravne cislo bolo " << randNum << ", uhadol si ho na " << i << ". pokus." << std::endl;
	system("pause > nul");
}

int main() {
	system("title GuessMaster");

	while (true) {
		system("cls");
		system("color 3");
		srand(static_cast<unsigned int>(time(0)));

		printBanner();
		unsigned int level = levelChoice();

		lv(level);
	}

	return 0;
}