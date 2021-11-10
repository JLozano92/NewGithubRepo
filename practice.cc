// Input & Output
#include <iostream>
// To work with strings
#include <string>
// have list of arguments
#include <vector>
// To read and write to files
#include <fstream>

using namespace std;

int main(int argc, char const *argv[]) {
  vector<string> args = vector<string>(argv, argv + argc);
  if (args.size() < 2){
    cout << "Not enough args. Please provide an input file.\n";
    return 1;
  }
  
  string input_filename;
  try {
    input_filename = args.at(1);
  } catch(exception const& problem){
    cout << "Could not read the command line.\n";
    cout << problem.what() << "\n";
    return 1;
  }
  
  // Create an input file stream and open the file
  ifstream input_file_stream(input_filename);
  // Check to make sure the file is open
  if(!input_file_stream.is_open()){
    cout << "Could not open the file " << input_filename << "\n";
    return 1;
  }
  
  // Read all the lines from the file
  for(string line_buffer; getline(input_file_stream, line_buffer); /* empty */){
    cout << line_buffer << "\n";
  }
  /*
  while(input_file_stream){
    string line_buffer;
    getline(input_file_stream, line_buffer);
    cout << line_buffer << "\n";
  }
  */
  if (input_file_stream.eof()){
    cout << "End of file reached successfully!\n";
  }else if (input_file_stream.bad()){
    cout << "I/O error while reading.\n";
    return 1;
  }else if (input_file_stream.fail()){
    cout << "Failure: long lines.\n";
    return 1;
  }
  // Close the file because we are done using it
  input_file_stream.close();
  return 0;
}
