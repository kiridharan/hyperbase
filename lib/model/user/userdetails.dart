// class UserQuery {
// 	String? _iD;
// 	ChannelDetails? _channelDetails;
// 	String? _emailId;
// 	String? _name;
// 	List? _orgDetails;
// 	String? _password;
// 	ChannelDetails? _smartContracts;
// 	String? _type;

// 	UserQuery({String? iD, ChannelDetails? channelDetails, String? emailId, String? name, List<void>? orgDetails, String? password, ChannelDetails? smartContracts, String? type}) {
// if (iD != null) {
// _iD = iD;
// }
// if (channelDetails != null) {
// _channelDetails = channelDetails;
// }
// if (emailId != null) {
// _emailId = emailId;
// }
// if (name != null) {
// _name = name;
// }
// if (orgDetails != null) {
// _orgDetails = orgDetails;
// }
// if (password != null) {
// _password = password;
// }
// if (smartContracts != null) {
// _smartContracts = smartContracts;
// }
// if (type != null) {
// _type = type;
// }
// }

// 	String? get iD => _iD;
// 	set iD(String? iD) => _iD = iD;
// 	ChannelDetails? get channelDetails => _channelDetails;
// 	set channelDetails(ChannelDetails? channelDetails) => _channelDetails = channelDetails;
// 	String? get emailId => _emailId;
// 	set emailId(String? emailId) => _emailId = emailId;
// 	String? get name => _name;
// 	set name(String? name) => _name = name;
// 	List<void>? get orgDetails => _orgDetails;
// 	set orgDetails(List<void>? orgDetails) => _orgDetails = orgDetails;
// 	String? get password => _password;
// 	set password(String? password) => _password = password;
// 	ChannelDetails? get smartContracts => _smartContracts;
// 	set smartContracts(ChannelDetails? smartContracts) => _smartContracts = smartContracts;
// 	String? get type => _type;
// 	set type(String? type) => _type = type;

// 	UserQuery.fromJson(Map<String, dynamic> json) {
// 		_iD = json['ID'];
// 		_channelDetails = json['channelDetails'] != null ? ChannelDetails.fromJson(json['channelDetails']) : null;
// 		_emailId = json['emailId'];
// 		_name = json['name'];
// 		if (json['orgDetails'] != null) {
// 			_orgDetails = <Null>[];
// 			json['orgDetails'].forEach((v) { _orgDetails!.add(v.fromJson(v)); });
// 		}
// 		_password = json['password'];
// 		_smartContracts = json['smartContracts'] != null ? ChannelDetails.fromJson(json['smartContracts']) : null;
// 		_type = json['type'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		data['ID'] = _iD;
// 		if (_channelDetails != null) {
//       data['channelDetails'] = _channelDetails!.toJson();
//     }
// 		data['emailId'] = _emailId;
// 		data['name'] = _name;
// 		if (_orgDetails != null) {
//       data['orgDetails'] = _orgDetails!.map((v) => v.toJson()).toList();
//     }
// 		data['password'] = _password;
// 		if (_smartContracts != null) {
//       data['smartContracts'] = _smartContracts!.toJson();
//     }
// 		data['type'] = _type;
// 		return data;
// 	}
// }

// class ChannelDetails {


// 	ChannelDetails({});



// 	ChannelDetails.fromJson(Map<String, dynamic> json);

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		return data;
// 	}
// }

// class UserQuery {
// 	String? _iD;
// 	ChannelDetails? _channelDetails;
// 	String? _emailId;
// 	String? _name;
// 	List<void>? _orgDetails;
// 	String? _password;
// 	ChannelDetails? _smartContracts;
// 	String? _type;

// 	UserQuery({String? iD, ChannelDetails? channelDetails, String? emailId, String? name, List<void>? orgDetails, String? password, ChannelDetails? smartContracts, String? type}) {
// if (iD != null) {
// _iD = iD;
// }
// if (channelDetails != null) {
// _channelDetails = channelDetails;
// }
// if (emailId != null) {
// _emailId = emailId;
// }
// if (name != null) {
// _name = name;
// }
// if (orgDetails != null) {
// _orgDetails = orgDetails;
// }
// if (password != null) {
// _password = password;
// }
// if (smartContracts != null) {
// _smartContracts = smartContracts;
// }
// if (type != null) {
// _type = type;
// }
// }

// 	String? get iD => _iD;
// 	set iD(String? iD) => _iD = iD;
// 	ChannelDetails? get channelDetails => _channelDetails;
// 	set channelDetails(ChannelDetails? channelDetails) => _channelDetails = channelDetails;
// 	String? get emailId => _emailId;
// 	set emailId(String? emailId) => _emailId = emailId;
// 	String? get name => _name;
// 	set name(String? name) => _name = name;
// 	List<void>? get orgDetails => _orgDetails;
// 	set orgDetails(List<void>? orgDetails) => _orgDetails = orgDetails;
// 	String? get password => _password;
// 	set password(String? password) => _password = password;
// 	ChannelDetails? get smartContracts => _smartContracts;
// 	set smartContracts(ChannelDetails? smartContracts) => _smartContracts = smartContracts;
// 	String? get type => _type;
// 	set type(String? type) => _type = type;

// 	UserQuery.fromJson(Map<String, dynamic> json) {
// 		_iD = json['ID'];
// 		_channelDetails = json['channelDetails'] != null ? ChannelDetails.fromJson(json['channelDetails']) : null;
// 		_emailId = json['emailId'];
// 		_name = json['name'];
// 		if (json['orgDetails'] != null) {
// 			_orgDetails = <Null>[];
// 			json['orgDetails'].forEach((v) { _orgDetails!.add(void.fromJson(v)); });
// 		}
// 		_password = json['password'];
// 		_smartContracts = json['smartContracts'] != null ? ChannelDetails.fromJson(json['smartContracts']) : null;
// 		_type = json['type'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		data['ID'] = _iD;
// 		if (_channelDetails != null) {
//       data['channelDetails'] = _channelDetails!.toJson();
//     }
// 		data['emailId'] = _emailId;
// 		data['name'] = _name;
// 		if (_orgDetails != null) {
//       data['orgDetails'] = _orgDetails!.map((v) => v.toJson()).toList();
//     }
// 		data['password'] = _password;
// 		if (_smartContracts != null) {
//       data['smartContracts'] = _smartContracts!.toJson();
//     }
// 		data['type'] = _type;
// 		return data;
// 	}
// }
