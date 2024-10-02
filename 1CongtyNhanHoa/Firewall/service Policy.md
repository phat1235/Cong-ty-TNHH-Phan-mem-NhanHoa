Ba tùy chọn trong menu **Actions**  đề cập liên quan đến cách dịch vụ được khởi động và dừng trên hệ thống VMware ESXi. Các tùy chọn này thường được sử dụng để cấu hình cách các dịch vụ hệ thống tương tác với các điều kiện khác nhau.

1. **Start and stop with firewall ports**:
   - **Mô tả**: Tùy chọn này cho phép dịch vụ tự động khởi động và dừng khi các cổng tường lửa liên quan được mở hoặc đóng.
        - Nếu tường lửa của ESXi mở các cổng cần thiết cho dịch vụ, dịch vụ sẽ tự động bắt đầu. Ngược lại, nếu cổng bị đóng, dịch vụ cũng sẽ dừng lại.
   - **Khi nào sử dụng**: Tùy chọn này hữu ích khi bạn muốn dịch vụ chỉ chạy khi tường lửa cho phép lưu lượng qua các cổng cụ thể. Điều này giúp tối ưu hóa bảo mật và tài nguyên bằng cách chỉ kích hoạt dịch vụ khi cần thiết.

2. **Start and stop with host**:
   - **Mô tả**: Với tùy chọn này, dịch vụ sẽ tự động khởi động khi máy chủ ESXi được khởi động và sẽ dừng khi máy chủ ESXi ngừng hoạt động hoặc được tắt. 
        - Đây là cách hoạt động tiêu chuẩn cho các dịch vụ thiết yếu trên hệ thống, đảm bảo rằng dịch vụ luôn hoạt động cùng với hệ thống.
   - **Khi nào sử dụng**: Tùy chọn này phù hợp cho các dịch vụ mà bạn muốn luôn hoạt động khi máy chủ ESXi hoạt động, bất kể tình trạng tường lửa hay các cổng mạng.

3. **Start and stop manually** là một tùy chọn khác trong danh sách các phương thức quản lý dịch vụ trên VMware ESXi. 

    - **Mô tả**: Tùy chọn này cho phép bạn **khởi động** và **dừng** dịch vụ **thủ công**. Nghĩa là dịch vụ sẽ **không tự động** bắt đầu khi máy chủ ESXi khởi động, hoặc khi các cổng tường lửa được mở.
        - Bạn phải vào giao diện quản lý (chẳng hạn như vSphere Client) và **tự tay khởi động hoặc dừng** dịch vụ khi cần.

    - **Khi nào sử dụng**:  Tùy chọn này hữu ích khi bạn muốn kiểm soát chính xác thời điểm dịch vụ chạy. Ví dụ, nếu bạn chỉ muốn dịch vụ chạy trong những trường hợp cụ thể hoặc bạn đang thực hiện các thao tác bảo trì, kiểm tra hệ thống mà không muốn dịch vụ tự động khởi động.
        - Điều này cũng có thể giúp tối ưu hóa tài nguyên hệ thống hoặc nâng cao tính bảo mật khi dịch vụ chỉ được khởi động khi cần thiết.
