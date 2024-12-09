part of 'widget.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.text = '',
    this.isSender = false,
    this.hasProduct = false,
  });

  final String text;
  final bool isSender;
  final bool hasProduct;

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 255,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor5,
          border: Border.all(color: primaryColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  child: Image.asset(
                    'assets/image_shoes.png',
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoes Arei V.2.0 - black',
                        style: primaryTextStyle,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'IDR',
                          decimalDigits: 0,
                        ).format(75000),
                        style: priceTextStyle.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Add to Chart',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Buy Now',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                    backgroundColor: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : SizedBox(),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            decoration: BoxDecoration(
              color: backgroundColor5,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSender ? 20 : 0),
                topRight: Radius.circular(isSender ? 0 : 20),
                bottomLeft: Radius.circular(isSender ? 0 : 20),
                bottomRight: Radius.circular(isSender ? 20 : 0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
