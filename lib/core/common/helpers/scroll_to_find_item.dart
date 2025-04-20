import 'package:flutter/material.dart';

class ScrollHelper {
  /// Scrolls to an item in a paginated list
  ///
  /// Parameters:
  /// - scrollController: The ScrollController for the list
  /// - targetId: The ID of the item to scroll to
  /// - itemHeight: Approximate height of each item
  /// - items: Current list of items
  /// - hasReachedMax: Whether pagination has reached the end
  /// - loadNextPage: Function to load the next page
  /// - findItem: Function to find the target item in the list
  static Future<void> scrollToItem<T>({
    required ScrollController scrollController,
    required String targetId,
    required double itemHeight,
    required List<T> items,
    required bool hasReachedMax,
    required Future<void> Function() loadNextPage,
    required bool Function(T item) findItem,
  }) async {
    try {
      print('Starting scroll to item: $targetId');

      // Wait for initial data load with timeout
      int attempts = 0;
      while (items.isEmpty && attempts < 20) {
        await Future.delayed(Duration(milliseconds: 100));
        attempts++;
      }

      if (items.isEmpty) {
        print('Failed to load initial data after $attempts attempts');
        return;
      }

      // Keep loading pages and scrolling until we find the item
      bool found = false;
      int pageLoadAttempts = 0;

      while (!found && !hasReachedMax && pageLoadAttempts < 10) {
        found = items.any(findItem);

        print('Searching for item. Found: $found, Page: $pageLoadAttempts');

        if (!found) {
          try {
            if (scrollController.hasClients) {
              final currentPosition = scrollController.position.maxScrollExtent;
              await scrollController.animateTo(
                currentPosition,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              print('ScrollController has no clients');
              await Future.delayed(Duration(milliseconds: 200));
              continue;
            }

            // Load next page
            await loadNextPage();
            await Future.delayed(Duration(milliseconds: 800));
            pageLoadAttempts++;
          } catch (scrollError) {
            print('Error during scroll: $scrollError');
            await Future.delayed(Duration(milliseconds: 200));
          }
        }
      }

      if (found) {
        print('Item found, attempting to scroll to position');

        final index = items.indexWhere(findItem);

        if (index != -1 && scrollController.hasClients) {
          for (int i = 0; i < 3; i++) {
            try {
              final itemPosition = index * itemHeight;
              await scrollController.animateTo(
                itemPosition,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );

              print('Successfully scrolled to position $itemPosition');
              break;
            } catch (scrollError) {
              print('Scroll attempt $i failed: $scrollError');
              await Future.delayed(Duration(milliseconds: 200));
            }
          }
        } else {
          print('Invalid index ($index) or scroll controller not ready');
        }
      } else {
        print('Item not found after $pageLoadAttempts page loads');
      }
    } catch (e, stackTrace) {
      print('Error in scrollToItem: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
