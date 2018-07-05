# Readme （中文在下方）
## Objective: 
Demonstrating how to use Generic Mapping Tools (GMT) to layout group IDs on ID card. Awk is also used to process the table data.
## Sample Output:
![Sample image](./SampleOutput/Page1.jpg)  
## Usage
1. Prepare 9 images in ```./images``` directory. The image ratio should be 5:7 (Portrait) .
2.  **In terminal.app:**  
```sh NameCardGenerator.sh ${GroupList.csv}```  
Here we use **bash** as shell.  
${GroupList.csv} is the group ID list of Day 1 to Day 3.  
The example of ${GroupList.csv} is in the root of this project.  

**Columes of the table is in following order:**  
Name,Grade,Department,StudentID,Gender,Day1,Day2,Day3  

##Author: 
Sun, ChengWei (r05224123 {at} ntu.edu.tw)

##License: 
[Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) ](https://creativecommons.org/licenses/by-sa/4.0/)  
![CC 4.0 Attribution-ShareAlike image](https://licensebuttons.net/l/by-sa/4.0/88x31.png)   
  
## 目的：  
示範如何使用通用製圖工具（GMT）與 awk 進行表格處理與名牌的排版。  

## 範例輸出：  
![Sample image](./SampleOutput/Page1.jpg)  

## 使用方式：  
1. 準備9張圖片放在 ```./image``` 的資料夾。圖片的比例需為 5:7（直式）。    
2. 在**終端機（Terminal.app）**中輸入：  
```sh NameCardGenerator.sh ${GroupList.csv}```  
這邊我們使用**bash**作為Shell。  
GroupList.csv 的範例在計畫的根目錄。  
GroupList.csv 欄位定義如下：  
姓名,年級,系所,學號,性別,第一天組別,第二天組別,第三天組別  

## 作者：
Sun, ChengWei (r05224123 {at} ntu.edu.tw)  

## 授權：
[創用 CC 4.0 姓名標示、相同方式分享](https://creativecommons.org/licenses/by-sa/4.0/)  
![CC 4.0 Attribution-ShareAlike image](https://licensebuttons.net/l/by-sa/4.0/88x31.png) 
