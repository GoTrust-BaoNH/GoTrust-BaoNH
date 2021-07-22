const dataNotificationMock = '''
<table style="
  border: 1px solid black;
  background-color: white;
  color: black;
  box-shadow: 3px 3px;">
  <tr>
   <td rowspan="5" style="background-color: red;color: red; width:3px;">a</td>
   <td style="color: white; font-size:11px">&ensp;a&ensp;<img src="https://www.w3schools.com/images/compatible_chrome.gif"></img></td>
   <td style="font-size:11px"><br>&ensp;&ensp;&ensp;Đã duyệt thành công!<br>&ensp;&ensp;&ensp;Gói bảo hiểm<font style="color: green; font-size:14px">&ensp;TNDSBB Xe máy</font><br></td>
   <td style="color: grey; font-size:10px"><br>&ensp;&ensp;&ensp;5 phút trước&ensp;&ensp;<br><br><br></td>
  </tr>
</table>''';

class NotificationItemModel {
  NotificationItemModel({
    this.htmlContent,
    this.icon,
    this.id,
    this.isRead,
    this.time,
    this.type,
  });

  final String? htmlContent;
  final String? icon;
  final String? id;
  final bool? isRead;
  final String? time;
  final int? type;
}
