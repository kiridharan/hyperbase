class Filter {
  getNetork(data, network) {
    final testNetworkItems = data.data!.stdout.where(
      (item) => item.namespace.contains(network),
    );

    return testNetworkItems;
  }

  // getfilterName(data) {
  //   final testNetworkItems = data.data!.stdout.where(
  //     (item) => item.namespace.contains('ca'),
  //   );
  //   return data;
  // }

  // filetNameCA(data) {
  //   final testNetworkItems = data.data!.stdout.where(
  //     (item) => item.namespace.contains('ca'),
  //   );
  //   return testNetworkItems;
  // }

  // filterNamedOrdered(data) {
  //   final testNetworkItems = data.data!.stdout.where(
  //     (item) => item.namespace.contains('ca'),
  //   );
  //   return testNetworkItems;
  // }

  // filterNamePeer(data) {
  //   final testNetworkItems = data.data!.stdout.where(
  //     (item) => item.namespace.contains('ca'),
  //   );
  //   return testNetworkItems;
  // }
}
