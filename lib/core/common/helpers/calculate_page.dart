int calculatePage({required int skip, required int limit}) {
  return (skip / limit).ceil() + 1;
}
