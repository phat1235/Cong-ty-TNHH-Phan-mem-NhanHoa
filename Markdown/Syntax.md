## Cú pháp Markdown cơ bản 
#### 1. Ta dùng `# -> #######` trước nội dung để hiển thị các Heading từ 1->6

 **Ví dụ:**

>       ##Thẻ Heading 2
>       ###Thẻ Heading 3

#### 2. Ta dùng dấu `*`, `**`, `***` bao quanh nội dung để hiển thị in nghiêng, in đậm và in đậm + nghiêng.

**Ví dụ:**

    *chữ nghiêng*

>**Kết quả**: *chữ nghiêng*

**Ví dụ:**

    **Chữ in đậm**

> **Kết quả**: **Chữ in đâm**

**Ví dụ:**

    ***Chữ in đậm + nghiêng***

> **Kết quả**: ***Chữ in đậm + nghiêng***

#### 3. Blockquote   

**Đoạn code**:
```
> Khối cấp 1.

>

>> Khối cấp 2.

>

> Quay lại khối cấp 1.
```
> **Kết quả**: 

> Khối cấp 1.

>

>> Khối cấp 2.

>

> Quay lại khối cấp 1.


#### 4. Chèn link
Để chèn hyperlink bạn chỉ cần paste luôn link đó vào file .md

    https://github.com

**Kết quả:**

https://github.com
    
Hoặc có thể thu gọn đường link

    [GitHub](https://github.com)

**Kết quả:**

***[GitHub](https://github.com)***


> ## This is a header.
> 
> 1.   Mục lục 1.
> 2.   Mục lục 2.
> 
> Đoạn code:
> 
>       return shell_exec("echo $input | $markdown_script");


#### 5. Bo code
Ta đặt code trong ` `` ` hoặc ` ``` ``` `

          `một dòng`
        ```nhiều dòng```

**Ví dụ:**

    ```sh
        auto eth0
        iface eth0 inet static
        ipaddress 10.10.10.10
        netmask 255.255.255.0
        gateway 10.10.10.1
        dns-nameservers 8.8.8.8
    ```
>**Kết quả:**

    auto eth0
    iface eth0 inet static
    ipaddress 10.10.10.10
    netmask 255.255.255.0
    gateway 10.10.10.1
    dns-nameservers 8.8.8.8
    
* Gạch đầu dòng thứ nhất
    * Thụt đầu dòng thứ nhất
    * Thụt đầu dòng thứ hai
* Gạch đầu dòng thứ hai


#### 6. Tạo mục lục:

[Mục lục](#Mucluc)

[I. Chương 1](#Chapter1)

[II. Chương 2](#Chapter2)

<a name="Chapter1"></a>
I. Chương 1

> -----------Content-------
<a name="Chapter2"></a>

II. Chương 2

> -----------Content-------


**Ví dụ:**

    <a name="Chapter1"></a>
    I. Chương 1
    -----------Content-------
    <a name="Chapter2"></a>
    II. Chương 2
    -----------Content-------
    




#### 8. Chèn ảnh

**Cú pháp:**
        
    ![](link "Alt image")

**Ví dụ:**

    ![](https://img001.prntscr.com/file/img001/x0IINvsBS-ugWJLohgBaQQ.png "Ảnh về LightShot")

> **Kết quả**
---
![](https://img001.prntscr.com/file/img001/x0IINvsBS-ugWJLohgBaQQ.png "Ảnh về down Git")

---
