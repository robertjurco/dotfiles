#include <functional>
#include <iostream>
#include <map>
#include <string>

class ConsoleMenu {
  	public:
    	ConsoleMenu(const std::string& message,
        	const std::string& invalidChoiceMessage,
        	const std::string& prompt,
	        const std::map<std::string, std::function<void()>>& commandsByChoice) :
        	 	message_(message), invalidChoiceMessage_(invalidChoiceMessage),
		      	prompt_(prompt), commandsByChoice_(commandsByChoice) {}
    	void use() {
      		std::string userChoice;
	    	std::cout << '\n';
      		while ((std::cout << message_) && printChoices() && (std::cout << prompt_) && (!(std::getline(std::cin, userChoice)) || !validChoice(userChoice))) {
       			 std::cout << '\n' << invalidChoiceMessage_;
		}
      	commandsByChoice_[userChoice]();
        }
  	private:
    	bool printChoices() {
      		bool successful = false;
      		for (auto commandByChoice : commandsByChoice_) {
        		successful = static_cast<bool>(
            		std::cout << '[' << commandByChoice.first << ']' << '\n');
     		}
     	return successful;
   	}
   	bool validChoice(const std::string& choice) {
		return commandsByChoice_.find(choice) != commandsByChoice_.end();
   	}
    	std::string message_; // label_?
    	std::string invalidChoiceMessage_;
    	std::string prompt_;
    	std::map<std::string, std::function<void()>> commandsByChoice_;
};

int main() {
	system("reset");
	bool yes = false;
    	//ConsoleMenu menu("Are you sure you want to shutdown?\n", "Invalid operation; ", "> ", {
    	//ConsoleMenu menu("Are you sure you want to reboot?\n", "Invalid operation; ", "> ", {
    	ConsoleMenu menu("Are you sure you want to leave i3?\n", "Invalid operation; ", "> ", {
      		{"yes", [&yes] {
        		yes = true;
      		}},
     		{"no", [&yes] {
       			yes = false;
      		}}
    	});
    	menu.use();
	if (yes==true){
	//system("poweroff");
	//system("reboot");
	system("i3 exit");
	}
  }
