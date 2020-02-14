import Flutter
import UIKit
import ImSDK

public class SwiftTencentImPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "tencent_im_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftTencentImPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        switch call.method {
        case "init":
            self.`init`(call: call, result: result)
            break
        case "login":
            self.login(call: call, result: result)
            break
        case "logout":
            self.logout(call: call, result: result)
            break
        case "getLoginUser":
            self.getLoginUser(call: call, result: result)
            break
        case "initStorage":
            self.initStorage(call: call, result: result)
            break
        case "getConversationList":
            getConversationList(call: call, result: result)
            break
        case "getConversation":
            getConversation(call: call, result: result)
            break
        case "getGroupInfo":
            self.getGroupInfo(call: call, result: result);
            break;
        case "getUserInfo":
            self.getUserInfo(call: call, result: result);
            break;
        case "getMessages":
            self.getMessages(call: call, result: result);
            break;
        case "getLocalMessages":
            self.getLocalMessages(call: call, result: result);
            break;
        case "setRead":
            self.setRead(call: call, result: result);
            break;
        case "sendCustomMessage":
            self.sendCustomMessage(call: call, result: result);
            break;
        case "sendTextMessage":
            self.sendTextMessage(call: call, result: result);
            break;
        case "sendSoundMessage":
            self.sendSoundMessage(call: call, result: result);
            break;
        case "sendImageMessage":
            self.sendImageMessage(call: call, result: result);
            break;
        case "sendVideoMessage":
            self.sendVideoMessage(call: call, result: result);
            break;
        case "getFriendList":
            self.getFriendList(call: call, result: result);
            break;
        case "getGroupList":
            self.getGroupList(call: call, result: result);
            break;
        case "addFriend":
            self.addFriend(call: call, result: result);
            break;
        case "checkSingleFriends":
            self.checkSingleFriends(call: call, result: result);
            break;
        case "getPendencyList":
            self.getPendencyList(call: call, result: result);
            break;
        case "pendencyReport":
            self.pendencyReport(call: call, result: result);
            break;
        case "deletePendency":
            self.deletePendency(call: call, result: result);
            break;
        case "examinePendency":
            self.examinePendency(call: call, result: result);
            break;
        case "deleteConversation":
            self.deleteConversation(call: call, result: result);
            break;
        case "deleteLocalMessage":
            self.deleteLocalMessage(call: call, result: result);
            break;
        case "createGroup":
            self.createGroup(call: call, result: result);
            break;
        case "inviteGroupMember":
            self.inviteGroupMember(call: call, result: result);
            break;
        case "applyJoinGroup":
            self.applyJoinGroup(call: call, result: result);
            break;
        case "quitGroup":
            self.quitGroup(call: call, result: result);
            break;
        case "deleteGroupMember":
            self.deleteGroupMember(call: call, result: result);
            break;
        case "getGroupMembers":
            self.getGroupMembers(call: call, result: result);
            break;
        case "deleteGroup":
            self.deleteGroup(call: call, result: result);
            break;
        case "modifyGroupOwner":
            self.modifyGroupOwner(call: call, result: result);
        case "modifyGroupInfo":
            self.modifyGroupInfo(call: call, result: result);
            break;
        case "modifyMemberInfo":
            self.modifyMemberInfo(call: call, result: result);
            break;
        case "getGroupPendencyList":
            self.getGroupPendencyList(call: call, result: result);
            break;
        case "reportGroupPendency":
            self.reportGroupPendency(call: call, result: result);
            break;
        case "groupPendencyAccept":
            self.groupPendencyAccept(call: call, result: result);
            break;
        case "groupPendencyRefuse":
            self.groupPendencyRefuse(call: call, result: result);
            break;
        case "getSelfProfile":
            self.getSelfProfile(call: call, result: result);
            break;
        case "modifySelfProfile":
            self.modifySelfProfile(call: call, result: result);
            break;
        case "modifyFriend":
            self.modifyFriend(call: call, result: result);
            break;
        case "deleteFriends":
            self.deleteFriends(call: call, result: result);
            break;
        case "addBlackList":
            self.addBlackList(call: call, result: result);
            break;
        case "deleteBlackList":
            self.deleteBlackList(call: call, result: result);
            break;
        case "getBlackList":
            self.getBlackList(call: call, result: result);
            break;
        case "createFriendGroup":
            self.createFriendGroup(call: call, result: result);
            break;
        case "deleteFriendGroup":
            self.deleteFriendGroup(call: call, result: result);
            break;
        case "addFriendsToFriendGroup":
            self.addFriendsToFriendGroup(call: call, result: result);
            break;
        case "deleteFriendsFromFriendGroup":
            self.deleteFriendsFromFriendGroup(call: call, result: result);
            break;
        case "renameFriendGroup":
            self.renameFriendGroup(call: call, result: result);
            break;
        case "getFriendGroups":
            self.getFriendGroups(call: call, result: result);
            break;
        default:
            result(FlutterMethodNotImplemented);
        }
    }
    
    /**
     * 初始化腾讯云IM
     */
    public func `init`(call: FlutterMethodCall, result: @escaping FlutterResult){
        if let appid = CommonUtils.getParam(call: call, result: result, param: "appid") as? String{
            // 初始化SDK配置
            let sdkConfig = TIMSdkConfig();
            sdkConfig.sdkAppId = (appid as NSString).intValue;
            // TODO 临时代码
            sdkConfig.disableLogPrint = true;
            sdkConfig.logLevel = TIMLogLevel.LOG_WARN;
            //            sdkConfig.logFunc =
            TIMManager.sharedInstance()?.initSdk(sdkConfig);
            
            // 初始化用户配置
            let userConfig = TIMUserConfig();
            userConfig.enableReadReceipt = true;
            TIMManager.sharedInstance()?.setUserConfig(userConfig);
            
            result(nil);
        }
    }
    
    /**
     * 登录
     */
    public func login(call: FlutterMethodCall, result: @escaping FlutterResult){
        if let identifier =  CommonUtils.getParam(call: call, result: result, param: "identifier") as? String ,
            let userSig =  CommonUtils.getParam(call: call, result: result, param: "userSig") as? String
        {
            // 如果已经登录，则不允许重复登录
            if TIMManager.sharedInstance()?.getLoginUser() != nil{
                result(
                    FlutterError(code: "login failed.", message: "user is login", details: "user is already login ,you should login out first")
                );
            }else{
                // 登录操作
                let loginParam = TIMLoginParam();
                loginParam.identifier = identifier;
                loginParam.userSig = userSig;
                //                int code, NSString * msg
                TIMManager.sharedInstance()?.login(loginParam, succ: {
                    result(nil);
                }, fail:TencentImUtils.returnErrorClosures(result: result))
            }
        }
    }
    
    /**
     * 登出
     */
    public func logout(call: FlutterMethodCall, result: @escaping FlutterResult){
        TIMManager.sharedInstance()?.logout({
            result(nil);
        },fail:TencentImUtils.returnErrorClosures(result: result));
    }
    
    /**
     * 获得当前登录用户
     */
    public func getLoginUser(call: FlutterMethodCall, result: @escaping FlutterResult){
        result(TIMManager.sharedInstance()?.getLoginUser());
    }
    
    /**
     * 初始化本地存储
     */
    public func initStorage(call: FlutterMethodCall, result: @escaping FlutterResult){
        if let identifier =  CommonUtils.getParam(call: call, result: result, param: "identifier") as? String
        {
            TIMManager.sharedInstance()?.initStorage(identifier, succ: {
                result(nil);
            },fail:TencentImUtils.returnErrorClosures(result: result));
        }
        
    }
    
    /**
     * 获得当前登录用户会话列表
     */
    public func getConversationList(call: FlutterMethodCall, result: @escaping FlutterResult){
        TencentImUtils.getConversationInfo(conversations:(TIMManager.sharedInstance()?.getConversationList())!,onSuccess: {
            (array)-> Void in
            result(JsonUtil.toJson(array));
        },onFail: TencentImUtils.returnErrorClosures(result: result));
    }
    
    /**
     * 根据ID获得会话
     */
    public func getConversation(call: FlutterMethodCall, result: @escaping FlutterResult){
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String{
            if let session = TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result){
                TencentImUtils.getConversationInfo(conversations:([session]),onSuccess: {
                    (array)-> Void in
                    if array.count >= 1{
                        result(JsonUtil.toJson(array[0]));
                    }else{
                        result(nil);
                    }
                },onFail: TencentImUtils.returnErrorClosures(result: result));
            }
        }
    }
    
    /**
     * 获得群信息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getGroupInfo(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let id =  CommonUtils.getParam(call: call, result: result, param: "id"){
            TIMGroupManager.sharedInstance()?.getGroupInfo([id], succ: {
                (array)-> Void in
                if array!.count >= 1{
                    result(JsonUtil.toJson(GroupInfoEntity(groupInfo: array![0] as! TIMGroupInfoResult)));
                }else{
                    result(nil);
                }
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 获得用户信息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getUserInfo(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let id =  CommonUtils.getParam(call: call, result: result, param: "id") as? String,
            let forceUpdate = CommonUtils.getParam(call: call, result: result, param: "forceUpdate") as? Bool{
            TIMFriendshipManager.sharedInstance()?.getUsersProfile([id], forceUpdate: forceUpdate, succ: {
                (array)-> Void in
                if array!.count >= 1{
                    result(JsonUtil.toJson(UserInfoEntity(userProfile: array![0])));
                }else{
                    result(nil);
                }
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 设置会话消息为已读
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func setRead(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String{
            if let session = TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result){
                session.setRead(nil, succ: {
                    result(nil);
                }, fail: TencentImUtils.returnErrorClosures(result: result))
            }
        }
    }
    
    
    /**
     * 获得消息列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getMessages(call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.getMessages(call: call, result: result, local: false);
    }
    
    /**
     * 获得本地消息列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getLocalMessages(call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.getMessages(call: call, result: result, local: true);
    }
    
    /**
     * 获得消息列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     * @param local      是否是获取本地消息
     */
    private func getMessages(call: FlutterMethodCall, result: @escaping FlutterResult, local : Bool) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let number = CommonUtils.getParam(call: call, result: result, param: "number") as? Int32
        {
            if let session = TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result){
                
                // 成功回调
                let successCallback = {
                    (array : Any) -> Void in
                    TencentImUtils.getMessageInfo(timMessages: array as! [TIMMessage], onSuccess: {
                        (array)-> Void in
                        result(JsonUtil.toJson(array));
                    }, onFail:  TencentImUtils.returnErrorClosures(result: result));
                };
                // 获取本地消息记录或云端消息记录
                if local{
                    session.getLocalMessage(number, last: nil, succ: successCallback, fail: TencentImUtils.returnErrorClosures(result: result))
                }else{
                    session.getMessage(number, last: nil, succ: successCallback, fail: TencentImUtils.returnErrorClosures(result: result))
                }
            }
        }
    }
    
    /**
     * 发送自定义消息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func sendCustomMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let data = CommonUtils.getParam(call: call, result: result, param: "data") as? String,
            let ol = CommonUtils.getParam(call: call, result: result, param: "ol") as? Bool
        {
            let message = TIMMessage();
            let customMessage = TIMCustomElem();
            customMessage.data = data.data(using: String.Encoding.utf8);
            message.add(customMessage);
            self.sendMessage(conversation: TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result)!, message: message, result: result, ol: ol);
        }
    }
    
    /**
     * 发送文本消息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func sendTextMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let content = CommonUtils.getParam(call: call, result: result, param: "content") as? String,
            let ol = CommonUtils.getParam(call: call, result: result, param: "ol") as? Bool
        {
            let message = TIMMessage();
            let textElem = TIMTextElem();
            textElem.text = content;
            message.add(textElem);
            self.sendMessage(conversation: TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result)!, message: message, result: result, ol: ol);
        }
    }
    
    
    /**
     * 发送语音消息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func sendSoundMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let ol = CommonUtils.getParam(call: call, result: result, param: "ol") as? Bool,
            let path = CommonUtils.getParam(call: call, result: result, param: "path") as? String,
            let duration = CommonUtils.getParam(call: call, result: result, param: "duration") as? Int32
        {
            let message = TIMMessage();
            let soundElem = TIMSoundElem();
            soundElem.path = path;
            soundElem.second = duration;
            message.add(soundElem);
            self.sendMessage(conversation: TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result)!, message: message, result: result, ol: ol);
        }
    }
    
    /**
     * 发送图片消息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func sendImageMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let ol = CommonUtils.getParam(call: call, result: result, param: "ol") as? Bool,
            let path = CommonUtils.getParam(call: call, result: result, param: "path") as? String
        {
            let message = TIMMessage();
            let imageElem = TIMImageElem();
            imageElem.path = path;
            message.add(imageElem);
            self.sendMessage(conversation: TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result)!, message: message, result: result, ol: ol);
        }
    }
    
    /**
     * 发送视频消息
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func sendVideoMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String,
            let ol = CommonUtils.getParam(call: call, result: result, param: "ol") as? Bool,
            let path = CommonUtils.getParam(call: call, result: result, param: "path") as? String,
            let duration = CommonUtils.getParam(call: call, result: result, param: "duration") as? Int32,
            let type = CommonUtils.getParam(call: call, result: result, param: "type") as? String,
            let snapshotWidth = CommonUtils.getParam(call: call, result: result, param: "snapshotWidth") as? Int32,
            let snapshotHeight = CommonUtils.getParam(call: call, result: result, param: "snapshotHeight") as? Int32,
            let snapshotPath = CommonUtils.getParam(call: call, result: result, param: "snapshotPath") as? String
        {
            // 视频数据
            let video = TIMVideo();
            video.duration = duration;
            video.type = type;
            
            // 缩略图数据
            let snapshot = TIMSnapshot();
            snapshot.width = snapshotWidth;
            snapshot.height = snapshotHeight;
            
            // 消息数据
            let message = TIMMessage();
            let videoElem = TIMVideoElem();
            videoElem.videoPath = path;
            videoElem.video = video;
            videoElem.snapshotPath = snapshotPath;
            videoElem.snapshot = snapshot;
            message.add(videoElem);
            self.sendMessage(conversation: TencentImUtils.getSession(sessionId: sessionId, sessionTypeStr: sessionTypeStr, result: result)!, message: message, result: result, ol: ol);
        }
    }
    
    /**
     * 发送消息
     *
     * @param conversation 会话
     * @param message      消息内容
     * @param result       Flutter返回对象
     * @param ol           是否使用在线消息发送
     */
    private func sendMessage(conversation : TIMConversation, message : TIMMessage, result : @escaping FlutterResult, ol : Bool) {
        
        /// 成功回调
        let successCallback = {
            () -> Void in
            result(nil);
        };
        
        // 根据状态发送在线或离线消息
        if ol{
            conversation.sendOnlineMessage(message, succ: successCallback, fail:TencentImUtils.returnErrorClosures(result: result));
        }else{
            conversation.send(message, succ: successCallback, fail:TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 获得好友列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getFriendList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        TIMFriendshipManager.sharedInstance()?.getFriendList({
            (array) -> Void in
            var resultData : [FriendEntity] = []
            for item in array!{
                resultData.append(FriendEntity(friend: item ));
            }
            result(JsonUtil.toJson(resultData));
        }, fail: TencentImUtils.returnErrorClosures(result: result));
    }
    
    /**
     * 获得群组列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getGroupList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        TIMGroupManager.sharedInstance()?.getGroupList({
            (array) -> Void in
            var ids : [String] = [];
            for item in array!{
                ids.append((item as! TIMGroupInfo).group)
            }
            
            if (ids.count == 0) {
                result(JsonUtil.toJson([]));
                return;
            }
            
            // 获得群资料
            TIMGroupManager.sharedInstance()?.getGroupInfo(ids, succ: {
                (array) -> Void in
                var resultData : [GroupInfoEntity] = []
                for item in array!{
                    resultData.append(GroupInfoEntity(groupInfo: item as! TIMGroupInfoResult));
                }
                result(JsonUtil.toJson(resultData));
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }, fail: TencentImUtils.returnErrorClosures(result: result));
    }
    
    /**
     * 添加好友
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func addFriend(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let id =  CommonUtils.getParam(call: call, result: result, param: "id") as? String,
            let addType = CommonUtils.getParam(call: call, result: result, param: "addType") as? Int,
            let remark = CommonUtils.getParam(call: call, result: result, param: "remark") as? String,
            let addWording = CommonUtils.getParam(call: call, result: result, param: "addWording") as? String,
            let addSource = CommonUtils.getParam(call: call, result: result, param: "addSource") as? String,
            let friendGroup = CommonUtils.getParam(call: call, result: result, param: "friendGroup") as? String
        {
            let request = TIMFriendRequest();
            request.identifier = id;
            request.addType = TIMFriendAddType(rawValue: addType)!;
            request.remark = remark;
            request.addWording = addWording;
            request.addSource = addSource;
            request.group = friendGroup;
            
            
            TIMFriendshipManager.sharedInstance()?.addFriend(request, succ: {
                (data) -> Void in
                result(JsonUtil.toJson(FriendResultEntity(result: data!)));
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 检测单个好友关系
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func checkSingleFriends(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let type = ((call.arguments as! [String:Any])["type"]) as? Int;
        if let id =  CommonUtils.getParam(call: call, result: result, param: "id") as? String
        {
            let checkInfo = TIMFriendCheckInfo();
            if type != nil{
                checkInfo.checkType = TIMFriendCheckType(rawValue: type!)!;
            }
            checkInfo.users = [id];
            
            TIMFriendshipManager.sharedInstance()?.checkFriends(checkInfo, succ: {
                (array) -> Void in
                result(JsonUtil.toJson(FriendCheckResultEntity(result: (array!)[0])));
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 获得未决好友列表(申请中)
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getPendencyList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let seq = ((call.arguments as! [String:Any])["seq"]) as? UInt64;
        let timestamp = ((call.arguments as! [String:Any])["timestamp"]) as? UInt64;
        let numPerPage = ((call.arguments as! [String:Any])["numPerPage"]) as? UInt64;
        if let type = CommonUtils.getParam(call: call, result: result, param: "type") as? Int
        {
            let request = TIMFriendPendencyRequest();
            request.type = TIMPendencyType(rawValue: type)!;
            if seq != nil{
                request.seq = seq!;
            }
            if timestamp != nil{
                request.timestamp = timestamp!;
            }
            if numPerPage != nil{
                request.numPerPage = numPerPage!;
            }
            
            TIMFriendshipManager.sharedInstance()?.getPendencyList(request, succ: {
                (data) -> Void in
                if data?.pendencies.count == 0{
                    result("{}");
                    return;
                }
                
                // 返回结果
                var resultData = [PendencyEntity]();
                
                // 用户ID对应用户对象
                var map : [String:PendencyEntity] = [:];
                
                // 循环获得的列表，进行对象封装
                for item in data!.pendencies{
                    map[item.identifier] = PendencyEntity(item: item);
                }
                
                // 获得用户信息
                TIMFriendshipManager.sharedInstance()?.getUsersProfile(Array(map.keys), forceUpdate: true, succ: {
                    (array) -> Void in
                    
                    // 填充用户对象
                    for item in array!{
                        if let data = map[item.identifier]{
                            data.userProfile = UserInfoEntity(userProfile: item);
                            resultData.append(data);
                        }
                    }
                    
                    // 返回结果
                    result(JsonUtil.toJson(resultData));
                }, fail: TencentImUtils.returnErrorClosures(result: result));
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 未决已读上报
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func pendencyReport(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let timestamp =  CommonUtils.getParam(call: call, result: result, param: "timestamp") as? UInt64
        {
            TIMFriendshipManager.sharedInstance()?.pendencyReport(timestamp, succ: {
                result(nil);
            }, fail: TencentImUtils.returnErrorClosures(result: result))
        }
    }
    
    /**
     * 未决删除
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deletePendency(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let type =  CommonUtils.getParam(call: call, result: result, param: "type") as? Int,
            let id =  CommonUtils.getParam(call: call, result: result, param: "id") as? String
        {
            TIMFriendshipManager.sharedInstance()?.delete(TIMPendencyType(rawValue: type)!, users: [id], succ:{
                result(nil);
            }, fail: TencentImUtils.returnErrorClosures(result: result))
        }
    }
    
    /**
     * 未决审核
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func examinePendency(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let remark = ((call.arguments as! [String:Any])["remark"]) as? String;
        if let type =  CommonUtils.getParam(call: call, result: result, param: "type") as? Int,
            let id =  CommonUtils.getParam(call: call, result: result, param: "id") as? String
        {
            let response = TIMFriendResponse();
            if remark != nil{
                response.remark = remark!;
            }
            response.responseType = TIMFriendResponseType(rawValue: type)!;
            response.identifier = id;
            
            TIMFriendshipManager.sharedInstance()?.do(response, succ: {
                (data) -> Void in
                result(nil);
            }, fail: TencentImUtils.returnErrorClosures(result: result));
        }
    }
    
    /**
     * 删除会话
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteConversation(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String
        {
            TIMManager.sharedInstance()?.delete(TIMConversationType(rawValue: SessionType.getEnumByName(name: sessionTypeStr)!.rawValue)!, receiver: sessionId);
            result(nil);
        }
    }
    
    /**
     * 删除会话内的本地聊天记录
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteLocalMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let sessionId =  CommonUtils.getParam(call: call, result: result, param: "sessionId") as? String,
            let sessionTypeStr = CommonUtils.getParam(call: call, result: result, param: "sessionType") as? String
        {
            TIMManager.sharedInstance()?.deleteConversationAndMessages(TIMConversationType(rawValue: SessionType.getEnumByName(name: sessionTypeStr)!.rawValue)!, receiver: sessionId);
            result(nil);
        }
    }
    
    /**
     * 创建群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func createGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 邀请加入群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func inviteGroupMember(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 申请加入群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func applyJoinGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 退出群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func quitGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 删除群组成员
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteGroupMember(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 获取群成员列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getGroupMembers(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 解散群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 转让群组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func modifyGroupOwner(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 修改群资料
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func modifyGroupInfo(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 修改群成员资料
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func modifyMemberInfo(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 获得未决群列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getGroupPendencyList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 上报未决已读
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func reportGroupPendency(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 同意申请
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func groupPendencyAccept(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 拒绝申请
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func groupPendencyRefuse(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 获取自己的资料
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getSelfProfile(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 修改自己的资料
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func modifySelfProfile(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 修改好友的资料
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func modifyFriend(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 删除好友
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteFriends(call: FlutterMethodCall, result: @escaping FlutterResult) {
    }
    
    /**
     * 添加到黑名单
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func addBlackList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    
    /**
     * 从黑名单删除
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteBlackList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 获得黑名单列表
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getBlackList(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 创建好友分组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func createFriendGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 删除好友分组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteFriendGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 添加好友到某个分组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func addFriendsToFriendGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 从分组删除好友
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func deleteFriendsFromFriendGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 重命名分组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func renameFriendGroup(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    /**
     * 获得好友分组
     *
     * @param methodCall 方法调用对象
     * @param result     返回结果对象
     */
    private func getFriendGroups(call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
}
