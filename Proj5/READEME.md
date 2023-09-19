### 程式內容:
     
建立一個Input array內容為8個數字不按照大小排列，存取其位置與大小，進入NumSort function，
使用malloc配置一個與Input array相同大小的記憶體空間（一個空的array），將Input array的內容複製進入這個array，
進行氣泡排序法，將數字由小排到大，並回存至array，形成一個Output array，將r0指到Output array的位置回傳到main，
開始進行sprintf，利用迴圈將Output array 的數值經由sprintf轉成字元並存入string_adds形成字串，然後使用SWI_Open開
起一個result.txt的檔案，然後用SWI_Write寫入string_adds字串，之後用SWI_Close關閉檔案結束程式。
