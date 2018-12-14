String vowels="aeiouyAEIOUY";
char[] cArray = vowels.toCharArray();
String[] Words;
String[] Words2;
int index;
String[] Sentences;
PImage cover;
float grade1, sentCount1, avgSybll1, wordCount1, avgWord1;
float grade2, sentCount2, avgSybll2, wordCount2, avgWord2;
boolean first=false, second=false, main = true;
stringer w = new stringer();

void setup() {
  size(800, 800);
  cover = loadImage("bookCover.jpg");
  cover.resize(200, 318);
  String[] lines = loadStrings("christmasCarol.txt"); //lines
  String carol = join(lines, " "); //entire play in one string
  Words = carol.split("[\\,!.\\-\\s]+");
  Sentences=splitTokens(carol, ".?!");
  grade1 = w.grade();
  sentCount1 = w.countSentences();
  wordCount1 = w.countWords();
  avgSybll1 = w.countSyllables(Words)/w.countWords();
  avgWord1 = w.countWords()/w.countSentences();


  lines = loadStrings("christmasCarol2.txt"); //lines
  carol = join(lines, " "); //entire play in one string
  Words2 = carol.split("[\\,!.\\-\\s]+");
  Sentences=splitTokens(carol, ".?!");
  grade2 = w.grade();
  sentCount2 = w.countSentences();
  wordCount2 = w.countWords();
  avgSybll2 = w.countSyllables(Words)/w.countWords();
  avgWord2 = w.countWords()/w.countSentences();

  frameRate(5);
}


void draw() {
  background(0);
  if (main==true) {
    fill(255);
    stroke(255);
    textSize(32);
    textAlign(CENTER);
    text("click the book cover\n for more imformation", 400, height/5);
    image(cover, 140, height/3);
    text("(PART 1)", 180, height/1.1);
    image(cover, 540, height/3);
    text("(PART 2)", 580, height/1.1);
    text(Words[index], 200, height/1.25);
    text(Words2[index], 600, height/1.25);
    index++;
  }
  if (mousePressed&&mouseX<width/2&&main==true) {
    first=true;
  } else if (mousePressed&&mouseX>width/2) {
    second = true;
  }
  if(first==true){
    main=false;
    background(0);
    text("A Christmas Carol part 1:",300, 200);
    text("Flesch Kincaid Grade Level: "+grade1, 200, 500);
    text("Word Count: "+wordCount1, 190, 550);
    text("Sentence Count: "+sentCount1, 195, 600);
    text("Average words per sentence: "+avgWord1, 320, 650);
    text("Average syllables per word: "+avgSybll1, 315, 700);
    
    if(key == CODED){
      if(keyCode == SHIFT){
        main=true;
        first = false;
      }
    }
    
  }
  if(second==true){
    main=false;
    background(0);
     text("A Christmas Carol part 2:",300, 200);
    text("Flesch Kincaid Grade Level: "+grade2, 200, 500);
    text("Word Count: "+wordCount2, 190, 550);
    text("Sentence Count: "+sentCount2, 195, 600);
    text("Average words per sentence: "+avgWord2, 320, 650);
    text("Average syllables per word: "+avgSybll2, 315, 700);
    if(key == CODED){
      if(keyCode == SHIFT){
        main=true;
        second = false;
      }
    }
  }
}

public class stringer {


  public stringer() {
  }
  /**
   *countWords();
   * A "word" is defined as a contiguous string of alphabetic characters
   * i.e. any upper or lower case characters a-z or A-Z.  This method completely 
   * ignores numbers when you count words, and assumes that the document/paragraph does not have 
   * any strings that combine numbers and letters. 
   */

  public float countWords() {
    float count = 0;
    count = Words.length;
    return count;
  }

  public float countVowels() {
    float count = 0;
    for (int i = 0; i<Words.length; i++) {

      for (int j = 0; j<Words[i].length(); j++) {

        for (int k = 0; k<cArray.length; k++) {

          if (Words[i].charAt(j)==cArray[k]) {

            count++;
          }
        }
      }
    }


    return count;
  }
  /**
   * Get the total number of syllables in the document (the paragraph). 
   * To count the number of syllables in a word, use the following rules:
   *       Each contiguous sequence of one or more vowels is a syllable, 
   *       with the following exception: a lone "e" at the end of a word 
   *       is not considered a syllable unless the word has no other syllables. 
   *       You should consider y a vowel.
   */
  public float countSyllables(String[] w) {
    float countSyll = 0;
    for (String s : w) {
      countSyll+=countSyllablesRunner(s);
    }
    return countSyll;
  }

  public float countSyllablesRunner(String word) {
    float count = 0;
    boolean newSyll = true;
    char [] wArray = word.toCharArray();

    for (int i = 0; i<wArray.length; i++) {
      if (i == wArray.length-1 && wArray[i] == 'e' && newSyll && count>0) {
        count--;
      }
      if (newSyll && vowels.indexOf(wArray[i])>=0) {
        newSyll = false; 
        count++;
      } else if (vowels.indexOf(wArray[i])<0) {
        newSyll = true;
      }
    }
    return count;
  }

  /**
   * Eventually write this one too. Get the number of sentences in the document/paragraph.
   * Sentences are defined as contiguous strings of characters ending in an 
   * end of sentence punctuation (. ! or ?) or the last contiguous set of 
   * characters in the document, even if they don't end with a punctuation mark.
   */

  public float countSentences() {

    return Sentences.length;
  }
  public float grade() {
    float grade = ((.39*(countWords()/countSentences()))+(11.8*(countSyllables(Words)/countWords())))-15.59;
    return grade;
  }
}
