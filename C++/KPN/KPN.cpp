#include <iostream>
#include <cstdlib>
#include <ctime>
#include <random>

int pWinCount;
int pcWinCount;
char choiceTable[] = { 'K', 'P', 'N' };

int history[3][3] = {
{ 0, 0, 0 },
{ 0, 0, 0 },
{ 0, 0, 0 }
};

char upperChar(char character) {
	if (character >= 97 && character <= 122) {
		return character - 32;
	}
}

void printBanner() {
	std::cout << "\x1b[32m			  _  ______  _   _ \n			 | |/ /  _ \\| \\ | |\n			 | ' /| |_) |  \\| |\n			 | . \\|  __/| |\\  |\n			 |_|\\_\\_|   |_| \\_|\n\n";
}

int randChoice() {
	return rand() % 3;
}

void printScore() {
	std::cout << "PC: " << pcWinCount << std::endl;
	std::cout << "Ty: " << pWinCount << std::endl;
}
void winTest(char p, char pc) {
	if (p != 'K' && p != 'P' && p != 'N') {
		std::cerr << "Error zadaj K P alebo N\n";
		system("pause > nul");
		exit(-1);
	}

	std::string whoWin;
	if (p == 'K' && pc == 'K') {
		whoWin = "nikto";
	} else if (p == 'K' && pc == 'P') {
		whoWin = "PC";
	} else if (p == 'K' && pc == 'N') {
		whoWin = "si ty";
	} else if (p == 'P' && pc == 'K') {
		whoWin = "si ty";
	} else if (p == 'P' && pc == 'P') {
		whoWin = "nikto";
	} else if (p == 'P' && pc == 'N') {
		whoWin = "PC";
	} else if (p == 'N' && pc == 'K') {
		whoWin = "PC";
	} else if (p == 'N' && pc == 'P') {
		whoWin = "si ty";
	} else if (p == 'N' && pc == 'N') {
		whoWin = "nikto";
	}

	std::cout << "PC zahral " << pc << " ty si zahral " << p << ".\nVyhral " << whoWin << "." << std::endl;
	
	if (whoWin == "si ty") {
		pWinCount++;
	} else if (whoWin == "PC") {
		pcWinCount++;
	}

	system("pause > nul");
}

int charToId(char string) {
	if (string == 'K') {
		return 0;
	}
	else if (string == 'P') {
		return 1;
	}
	else if (string == 'N') {
		return 2;
	}
	else {
		return -1;
	}
}


void saveChoice(char choice, char lastChoice) {
	int choiceId = charToId(choice);
	int lastChoiceId = charToId(lastChoice);

	if (lastChoiceId != -1 && choiceId != -1) {
		history[lastChoiceId][choiceId]++;
	}
	else {
		std::cerr << "Error";
		system("pause > nul");
		exit(-1);
	}

}

char idToChar(int id) {
	if (id == 0) {
		return 'K';
	} 
	else if (id == 1) {
		return 'P';
	} 
	else if (id == 2) {
		return 'N';
	}
}

int prediction(char lastChoice) {
	int lastChoiceId = charToId(lastChoice);

	int count0 = 0;
	int count1 = 0;
	int count2 = 0;

	for (int i = 0; i <= 2; i++) {
		if (i == 0) {
			count0 = history[lastChoiceId][i];
		}
		else if (i == 1) {
			count1 = history[lastChoiceId][i];
		}
		else if (i == 2) {
			count2 = history[lastChoiceId][i];
		}
	}

	if (count0 > count1 && count0 > count2) {
		return 1;
	}
	else if (count1 > count0 && count1 > count2) {
		return 2;
	}
	else if (count2 > count0 && count2 > count1) {
		return 0;
	}
	else {
		return randChoice();
	}
}

int main() {
	srand(static_cast<unsigned int>(time(0)));
	system("title KPN");
	char pChoice;
	pChoice = '0';
	char pcChoice;
	char pLastChoice;


	for (int i = 0; true; i++) {
		system("cls");
		printBanner();

		pLastChoice = pChoice;

		printScore();

		std::cout << "Tvoja volba: ";
		std::cin >> pChoice;
		pChoice = upperChar(pChoice);

		if (i == 0) {
			pcChoice = idToChar(randChoice());
		}
		else {
			pcChoice = idToChar(prediction(pLastChoice));
			saveChoice(pChoice, pLastChoice);
		}

		winTest(pChoice, pcChoice);
	}

	return 0;
}