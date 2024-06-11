import http from '@ohos.net.http';
import router from '@ohos.router';
import curves from '@ohos.curves';
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct Index {
  @State on:Array<Array<string>>=new Array(3).fill(null).map(() => {
    return new Array(3).fill(null).map(() => {
            return "1";
    });
  });
  @State ksyx:number=0
  @State pl:string=''
  @State slpd:number=0
  @State dlzt:Array<string>=[]
  @State kl1:Array<string>=["","",""]
  @State kl2:Array<string>=["","",""]
  @State kl3:Array<string>=["","",""]
  @State sljg:Array<Resource>=[$r('app.media.sb'),$r('app.media.sl'),$r('app.media.pj')]
  @State sljg1:number=0
  @State ksan:Visibility=Visibility.Hidden
  @State my1:Visibility=Visibility.Visible
  @State pp:Visibility=Visibility.Visible
  @State ndqz:string=''
  @State ndqz1:number=0
  @State dqqz:string=''
  @State chs:Array<number>=new Array(2).fill(null).map(()=> {
      this.dsq()
      return 0;
  });


  build() {

    Column() {
      Column() {
        Row() {
          Text("等待对方上线中")
            .width(350)
            .height(250)
            .position({ x: 0, y: 150 })
            .visibility(this.pp)
            .zIndex(1000)
            .fontSize(40)
            .textAlign(TextAlign.Center)
          Image($r('app.media.xz'))
            .width(250)
            .height(150)
            .position({ x: 60, y: 300 })
            .visibility(this.pp)
            .zIndex(1000)
          Image(this.sljg[this.sljg1])
          // Text(this.pl+"获胜")
            // .textAlign(TextAlign.Center)
            // .fontSize(60)
            .height(200)
            .width(200)
            .visibility(this.ksan)
            .position({ x: 75, y: 360})
            .zIndex(1200)
            .backgroundColor('#ffffffff')
          Button("点我开启下一把")
            .height(120)
            .width(300)
            .fontSize(30)
            .onClick(() => this.ks())
            .visibility(this.ksan)
            .position({ x:30, y: 580 })
            .zIndex(2000)
          ForEach(this.kl1, (row, rowIndex) => {
            Text(this.kl1[rowIndex])
              .width(120)
              .height(120)
              .onClick(() => this.ontextClick(rowIndex, 1))
              .opacity(this.my(rowIndex) ? 1 : 1)
              .border({
                width: 1,
                color: 'rgb(0, 0, 0)',
                radius: 0,
                style: BorderStyle.Solid
              })
              .fontSize(70)
              .textAlign(TextAlign.Center)
          })
        }

        Row() {
          ForEach(this.kl2, (row, rowIndex) => {
            Text(this.kl2[rowIndex])
              .width(120)
              .height(120)
              .onClick(() => this.ontextClick(rowIndex, 2))
              .opacity(this.my(rowIndex) ? 1 : 1)
              .border({
                width: 1,
                color: 'rgb(0, 0, 0)',
                radius: 0,
                style: BorderStyle.Solid
              })
              .fontSize(70)
              .textAlign(TextAlign.Center)
          })
        }

        Row() {
          ForEach(this.kl3, (row, rowIndex) => {
            Text(this.kl3[rowIndex])
              .width(120)
              .height(120)
              .onClick(() => this.ontextClick(rowIndex, 3))
              .opacity(this.my(rowIndex) ? 1 : 1)
              .border({
                width: 1,
                color: 'rgb(0, 0, 0)',
                radius: 0,
                style: BorderStyle.Solid
              })
              .fontSize(70)
              .textAlign(TextAlign.Center)
          })
        }
        Text("你的棋子为")
          .width(120)
          .height(60)
          .fontSize(20)
          .position({ x: 50, y: 390 })
          .textAlign(TextAlign.Center)
          .visibility(this.my1)
        Text(this.ndqz)
          .width(120)
          .height(120)
          .textAlign(TextAlign.Center)
          .visibility(this.my1)
          .border({
            width: 1,
            color: 'rgba(202, 130, 130, 1.00)',
            radius: 0,
            style: BorderStyle.Solid
          })
          .fontSize(70)
          .position({ x: 50, y: 450 })
        Text("当前下棋的是")
          .width(120)
          .height(60)
          .fontSize(20)
          .position({ x: 190, y: 390 })
          .visibility(this.my1)
          .textAlign(TextAlign.Center)
          .zIndex(1)
        Text(this.dqqz)
          .width(120)
          .height(120)
          .fontSize(70)
          .visibility(this.my1)
          .zIndex(1)
          .textAlign(TextAlign.Center)
          .border({
            width: 1,
            color: 'rgba(202, 130, 130, 1.00)',
            radius: 0,
            style: BorderStyle.Solid
          })
          .position({ x: 190, y: 450 })

      }.margin({ top: 100, left:0})
    }
    .backgroundImage($r("app.media.jzqbj"))
    .backgroundImageSize({ width: '100%', height: '100%' })
    .height("100%")
    .width("100%")
  }


my(row: number){
  return true;
}
  dj(){//请求登录
    var url="http://192.168.137.157:8080/yh/yhzt"
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "data": "data to send",
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        usingCache: true, // 可选，默认为true
        priority: 1, // 可选，默认为1
        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
        usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + data.result);
        var kl=data.result.toString()
        console.info('Result:' + kl);
        this.dlzt[0]=kl.slice(38,39)
        this.dlzt[1]=kl.slice(48,49)
        console.info('Result:' +this.dlzt[0]+" "+this.dlzt[1]);
        if(this.dlzt[0]=="0" && this.dlzt[1]=="0"){
            this.dlxg(1)
            this.chs[0]=1
            this.ndqz="○"
        }
        else if(this.dlzt[0]=="0" && this.dlzt[1]=="1"){
          if(this.chs[0]==1){
              this.ksyx=0
          }
          else {
            this.dlxg(2)
            this.chs[0] = 2
            this.ndqz="×"
            this.ksyx=1
            this.pp=Visibility.Hidden
          }
        }
        else{
          this.ksyx=1
          this.pp=Visibility.Hidden

        }
      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }




  qpzt(){
    var that=this
    let qpzthq = setInterval(function() {
      var url="http://192.168.137.157:8080/qp/qpzt"
      let httpRequest = http.createHttp();
      // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
      // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
      httpRequest.on('headersReceive', (header) => {
        console.info('header: ' + JSON.stringify(header));
      });
      httpRequest.request(
        // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
        url,
        {
          method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
          // 开发者根据自身业务需要添加header字段
          header: {
            'Content-Type': 'application/json'
          },
          // 当使用POST请求时此字段用于传递内容
          extraData: {
            "data": "data to send",
          },
          expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
          usingCache: true, // 可选，默认为true
          priority: 1, // 可选，默认为1
          connectTimeout: 60000, // 可选，默认为60000ms
          readTimeout: 60000, // 可选，默认为60000ms
          usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
        }, (err, data) => {
        if (!err) {
          // data.result为HTTP响应内容，可根据业务需要进行解析
          console.info('qpzt' + data.result);
          var pp=data.result.toString()
          console.info('Result:' + pp);
          that.kl1[0]=pp.slice(101,102)
          that.kl1[1]=pp.slice(93,94)
          that.kl1[2]=pp.slice(45,46)
          that.kl2[0]=pp.slice(37,38)
          that.kl2[1]=pp.slice(61,62)
          that.kl2[2]=pp.slice(53,54)
          that.kl3[0]=pp.slice(77,78)
          that.kl3[1]=pp.slice(69,70)
          that.kl3[2]=pp.slice(85,86)
          var ji1=0
          var ji2=0
          for(let i=0;i<3;i++){
            if(that.kl1[i]=="0"){
                that.kl1[i]=''
            }
            else if(that.kl1[i]=='1'){
              that.kl1[i]='○'
              ji1=ji1+1
            }
            else {
              that.kl1[i]='×'
              ji2=ji2+1
            }

            if(that.kl2[i]=="0"){
              that.kl2[i]=''
            }
            else if(that.kl2[i]=='1'){
              that.kl2[i]='○'
              ji1=ji1+1
            }
            else {
              that.kl2[i]='×'
              ji2=ji2+1
            }
            if(that.kl3[i]=="0"){
              that.kl3[i]=''
            }
            else if(that.kl3[i]=='1'){
              that.kl3[i]='○'
              ji1=ji1+1
            }
            else {
              that.kl3[i]='×'
              ji2=ji2+1
            }
          }
          if(ji1<=ji2){
            that.dqqz='○'
            that.ndqz1=1
          }
          else{
            that.dqqz='×'
            that.ndqz1=2
          }
          that.sl()
          console.info('qpzt' +  that.kl1+that.kl2+that.kl3);
        } else {
          console.info('error:' + JSON.stringify(err));
          // 取消订阅HTTP响应头事件
          httpRequest.off('headersReceive');
          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy();
        }
      }
      );
      if(that.slpd==1) {
        clearInterval(qpzthq);
      }
    },1000)
  }

  dsq(){//
    var that=this
    let intervalID = setInterval(function() {
      that.dj()//请求登录
      if(that.ksyx==1){//
        clearInterval(intervalID);
        that.qpzt();//登录后触发棋盘
      }
    }, 5000);

  }


  dlxg(yh:number){
    var url="http://192.168.137.157:8080/yh/zxzt?yh="+yh
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "data": "data to send",
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        usingCache: true, // 可选，默认为true
        priority: 1, // 可选，默认为1
        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
        usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + data.result);
        var kl=data.result.toString()
        console.info('Result:' + kl);
        this.dlzt[0]=kl.slice(38,39)
        this.dlzt[1]=kl.slice(48,49)
        console.info('Result:' +this.dlzt[0]+" "+this.dlzt[1]);
        if(this.dlzt[0]=="0" && this.dlzt[1]=="0"){

        }
      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }



  ks(){
    this.my1=Visibility.Visible
    this.slpd=0
    this.dlxg(3)
    for(let i=1;i<=9;i++){
      this.xgqp(i,0)
    }
  for(let i=0;i<3;i++){
  this.kl1[i]=""
  this.kl2[i]=""
  this.kl3[i]=""
  }
    this.ndqz=''
    this.ndqz1=0
    this.dqqz=''
    this.pp=Visibility.Visible
    this.ksyx=0
    this.dsq()
    this.chs[0]=0
    this.ksan=Visibility.Hidden
    this.pl=''
    this.slpd=0
  }

  sl(){
    if(((this.kl1[0]=="○" ) && (this.kl1[2]=="○") &&(this.kl1[1]=="○")) ||
    ((this.kl2[0]=="○" ) && (this.kl2[2]=="○" ) && (this.kl2[1]=="○")) ||
    ((this.kl3[0]=="○" ) && (this.kl3[2]=="○" ) && (this.kl3[1]=="○")) ||
    ((this.kl1[0]=="○" ) && (this.kl2[0]=="○" ) && (this.kl3[0]=="○")) ||
    ((this.kl1[1]=="○" ) && (this.kl2[1]=="○" ) && (this.kl3[1]=="○")) ||
    ((this.kl1[2]=="○" ) && (this.kl2[2]=="○" ) && (this.kl3[2]=="○")) ||
    ((this.kl1[0]=="○" ) && (this.kl2[1]=="○" ) && (this.kl3[2]=="○")) ||
    ((this.kl3[0]=="○" ) && (this.kl2[1]=="○" ) && (this.kl1[2]=="○")))
    {
      this.pl='○'
      if(this.ndqz==this.pl){
        this.sljg1=1
      }
      else{
        this.sljg1=0
      }
      this.ksan=Visibility.Visible
      this.my1=Visibility.Hidden
      this.slpd=1
    }

    else if(((this.kl1[0]=="×" ) && (this.kl1[2]=="×") &&(this.kl1[1]=="×")) ||
    ((this.kl2[0]=="×" ) && (this.kl2[2]=="×" ) && (this.kl2[1]=="×")) ||
    ((this.kl3[0]=="×" ) && (this.kl3[2]=="×" ) && (this.kl3[1]=="×")) ||
    ((this.kl1[0]=="×" ) && (this.kl2[0]=="×" ) && (this.kl3[0]=="×")) ||
    ((this.kl1[1]=="×" ) && (this.kl2[1]=="×" ) && (this.kl3[1]=="×")) ||
    ((this.kl1[2]=="×" ) && (this.kl2[2]=="×" ) && (this.kl3[2]=="×")) ||
    ((this.kl1[0]=="×" ) && (this.kl2[1]=="×" ) && (this.kl3[2]=="×")) ||
    ((this.kl3[0]=="×" ) && (this.kl2[1]=="×" ) && (this.kl1[2]=="×")))
    {
      this.pl='×'
      this.ksan=Visibility.Visible
      this.my1=Visibility.Hidden
      if(this.ndqz==this.pl){
        this.sljg1=1
      }
      else{
        this.sljg1=0
      }
      this.slpd=1
    }
    else if(this.kl1[0]!=''&&this.kl1[1]!=''&&this.kl1[2]!=''&&this.kl2[0]!=''&&this.kl2[1]!=''&&this.kl2[2]!=''&& this.kl3[0]!=''&&this.kl3[1]!=''&&this.kl3[2]!=''){
      this.pl='没有人'
      this.sljg1=2
      this.ksan=Visibility.Visible
      this.my1=Visibility.Hidden
      this.slpd=1
    }
  }
  //修改棋盘
  xgqp(gz:number,qz:number){
    var url="http://192.168.137.157:8080/qp/xgzt?gz="+gz+"&qz="+qz
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "data": "data to send",
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        usingCache: true, // 可选，默认为true
        priority: 1, // 可选，默认为1
        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
        usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + data.result);
        var kl=data.result.toString()

      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }
  ontextClick(row: number,pd:number) {
    if(this.ksyx==1) {
      if (this.chs[0] == this.ndqz1) {
      if (pd == 1) {
        if(this.kl1[row]==''){
        if (this.chs[0] == 1) {
          this.kl1[row] = "○"
          this.xgqp(row + 1, 1)
          this.sl()
        }
        else if (this.chs[0] == 2) {
          this.kl1[row] = "×"
          this.xgqp(row + 1, 2)
          this.sl()
        }
        }
      }
      else if (pd == 2) {
        if(this.kl2[row]=='') {
          if (this.chs[0] == 1) {
            this.kl2[row] = "○"
            this.xgqp(row + 4, 1)
            this.sl()
          }
          else if (this.chs[0] == 2) {
            this.kl2[row] = "×"
            this.xgqp(row + 4, 2)
            this.sl()
          }
        }
      }
      else if (pd == 3) {
        if(this.kl3[row]=='') {
          if (this.chs[0] == 1) {
            this.kl3[row] = "○"
            this.xgqp(row + 7, 1)
            this.sl()
          }
          else if (this.chs[0] == 2) {
            this.kl3[row] = "×"
            this.xgqp(row + 7, 2)
            this.sl()
          }
        }
      }
    }
  }}

}
function getElementById(arg0: string) {
  throw new Error('Function not implemented.');
}
