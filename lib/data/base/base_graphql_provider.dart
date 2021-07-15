import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/resource/config/config_environment.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseServiceGraphQLProvider {
  BaseServiceGraphQLProvider._internal();

  static final config = Get.find<EnvConfiguration>();
  static final storage = Get.find<SharedPreferences>();

  static String? _token = '';

  static final HttpLink httpLink = HttpLink(config.value[GraphQLServiceUrl]!);

  static final AuthLink authLink = AuthLink(getToken: () async {
    _token = storage.getString(StorageConstants.token);
    if (_token != null) {
      return 'Bearer $_token';
    }
    return _token;
  });

  static Map<String, dynamic> getHeaderAuthorizationMap() {
    return <String, dynamic>{
      'headers': {AUTHORIZATION_FIELD: 'Bearer $_token'},
    };
  }

  static final WebSocketLink webSocketLink = WebSocketLink(
    config.value[WebSocketGraphQLUrl]!,
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: getHeaderAuthorizationMap,
    ),
  );

  // static final Link link = authLink.concat(httpLink).concat(webSocketLink);
  static final Link link = authLink.concat(httpLink);

  static final ValueNotifier<GraphQLClient> _graphQL = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  static final instance = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies(
          fetch: FetchPolicy.noCache,
        ),
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        mutate: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    ),
  );

  ValueNotifier<GraphQLClient> get graphQL => _graphQL;
}

class BaseAuthGraphQLProvider {
  BaseAuthGraphQLProvider._internal();

  static final config = Get.find<EnvConfiguration>();
  static final storage = Get.find<SharedPreferences>();

  static String? _token = '';

  static final HttpLink httpLink = HttpLink(config.value[GraphQLAuthUrl]!);

  static final AuthLink authLink = AuthLink(getToken: () async {
    _token = storage.getString(StorageConstants.token);
    if (_token != null) {
      return 'Bearer $_token';
    }
    return _token;
  });

  static Map<String, dynamic> getHeaderAuthorizationMap() {
    return <String, dynamic>{
      'headers': {AUTHORIZATION_FIELD: 'Bearer $_token'},
    };
  }

  static final WebSocketLink webSocketLink = WebSocketLink(
    config.value[WebSocketGraphQLUrl]!,
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: getHeaderAuthorizationMap,
    ),
  );

  // static final Link link = authLink.concat(httpLink).concat(webSocketLink);
  static final Link link = authLink.concat(httpLink);

  static final ValueNotifier<GraphQLClient> _graphQL = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  static final instance = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies(
          fetch: FetchPolicy.noCache,
        ),
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        mutate: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    ),
  );

  ValueNotifier<GraphQLClient> get graphQL => _graphQL;
}
