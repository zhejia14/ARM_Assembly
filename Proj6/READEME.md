### 程式內容:

data.txt內有400row每一row有198個數字，將前200row的數字讀進A矩陣內，
201-400row的數字讀進B矩陣內，A矩陣內的每一row跟B矩陣內所有的row做相乘並且將
所有的數字相加得到val將val放進一個名為sum的array，得到200個sum，將sum array
內的所有數字寫入到output.txt內。

---

SIMD instruction 應用在相乘的部分，將A矩陣一個row內原本有198個數字，
在後面再補上兩個0，形成200個元素，B矩陣也做相同的動作，使用SIMD的資料型態
_m128設定a指標，將A矩陣內200個元素變成每4個一組，形成50個元素，B矩陣利用b指標
也做相同的動作，之後用SIMD instruction:_mm_mul_ps(*a,*b)做相乘得到一個temp內部
有4個元素然後相加，之後再繼續做下一組，完成之後得到val然後進行寫入。
