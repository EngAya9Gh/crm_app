import 'package:crm_smart/model/cach_model.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';

import '../cache_repo.dart';
//
// const CACHE_HOME_KEY = "CACHE_HOME_KEY";
// const CACHE_HOME_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS
//
// const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
// const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis

abstract class LocalDataSource {
  Future<CacheRepository?> getCache(String key,int INTERVAL);

  Future<void> saveToCache(CacheRepository data,String key);

  void clearCache();

  void removeFromCache(String key);

}

class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<CacheRepository?> getCache(String Key,int INTERVAL) async {
    CachedItem? cachedItem = cacheMap[Key];

    if (cachedItem != null && cachedItem.isValid(INTERVAL )) {
      return cachedItem.data;
      // return the response from cache
    } else {
      // return error that cache is not valid
      //throw ErrorHandler.handle(DataSource.CACHE_ERROR);
      return null;
    }
  }
  @override
  Future<void> saveToCache(CacheRepository data, String key) async {
    cacheMap[key] = CachedItem(data);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }



  }

class cahe_data_source_invoice {

  // run time cache
  Map<String, CachedItem> cacheMap = Map();


  Future<List<InvoiceModel>?> getCache(String Key,int INTERVAL) async {
    CachedItem? cachedItem = cacheMap[Key];

    if (cachedItem != null && cachedItem.isValid(INTERVAL )) {
      return cachedItem.data;
      // return the response from cache
    } else {
      // return error that cache is not valid
      //throw ErrorHandler.handle(DataSource.CACHE_ERROR);
      return null;
    }
  }

  Future<void> saveToCache(List<InvoiceModel> data, String key) async {
    cacheMap[key] = CachedItem(data);
  }


  void clearCache() {
    cacheMap.clear();
  }


  void removeFromCache(String key) {
    cacheMap.remove(key);
  }


}

////////////////////////////////////////////

class cahe_data_source_client{

  // run time cache
  Map<String, CachedItem> cacheMap = Map();


  Future<List<ClientModel>?> getCache(String Key,int INTERVAL) async {
    CachedItem? cachedItem = cacheMap[Key];

    if (cachedItem != null && cachedItem.isValid(INTERVAL )) {
      return cachedItem.data;
      // return the response from cache
    } else {

      // return error that cache is not valid
      //throw ErrorHandler.handle(DataSource.CACHE_ERROR);
      return null;
    }
  }

  Future<void> saveToCache(List<ClientModel> data, String key) async {
    cacheMap[key] = CachedItem(data);
  }


  void clearCache() {
    cacheMap.clear();
  }


  void removeFromCache(String key) {
    cacheMap.remove(key);
  }


}