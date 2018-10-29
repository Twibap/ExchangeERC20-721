ERC20과 ERC721의 교환 시 maket contract에 approve한 뒤 교환하는 방식을 구현한다.

market contract 개입 없이 ERC20을 ERC721 contract에 approve한 뒤 ERC721에서 교환하는 방법은 작동한다.

market contract에 approve 한뒤 ERC721을 교환하는 경우 revert 발생

대안으로 escrow 방식으로 구현할 수 있다. 이 경우 거래가 이뤄지기 전에 market contract가 토큰을 소지하게 된다.
