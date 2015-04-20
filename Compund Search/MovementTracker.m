NSPredicate *searchPredicateStoreName = [NSPredicate predicateWithFormat:@"store_name contains[c] %@", searchBar.text];

NSPredicate *searchPredicateStoreAddress = [NSPredicate predicateWithFormat:@"address contains[c] %@", searchBar.text];

NSPredicate *searchPredicateContactNumber = [NSPredicate predicateWithFormat:@"phone_no contains[c] %@", searchBar.text];

NSArray *subPredicates = [NSArray arrayWithObjects:searchPredicateStoreName, searchPredicateStoreAddress,searchPredicateContactNumber, nil];

NSPredicate *orPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:subPredicates];

NSMutableArray *filteredArray =[self.storeArray filteredArrayUsingPredicate:orPredicate].mutableCopy;