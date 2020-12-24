// To parse this JSON data, do
//
//     final locationRestaraunts = locationRestarauntsFromJson(jsonString);

import 'dart:convert';

LocationRestaraunts locationRestarauntsFromJson(String str) 
              => LocationRestaraunts.fromJson(json.decode(str));

String locationRestarauntsToJson(LocationRestaraunts data)
                => json.encode(data.toJson());

class LocationRestaraunts {
    LocationRestaraunts({
        this.id,
        this.name,
        this.url,
        this.location,
        this.averageCostForTwo,
        this.priceRange,
        this.currency,
        this.thumb,
        this.featuredImage,
        this.photosUrl,
        this.menuUrl,
        this.eventsUrl,
        this.userRating,
        this.hasOnlineDelivery,
        this.isDeliveringNow,
        this.hasTableBooking,
        this.deeplink,
        this.cuisines,
        this.allReviewsCount,
        this.photoCount,
        this.phoneNumbers,
        this.photos,
        this.allReviews,
    });

    String id;
    String name;
    String url;
    Location location;
    String averageCostForTwo;
    String priceRange;
    String currency;
    String thumb;
    String featuredImage;
    String photosUrl;
    String menuUrl;
    String eventsUrl;
    UserRating userRating;
    String hasOnlineDelivery;
    String isDeliveringNow;
    String hasTableBooking;
    String deeplink;
    String cuisines;
    String allReviewsCount;
    String photoCount;
    String phoneNumbers;
    List<Photo> photos;
    List<AllReview> allReviews;

    factory LocationRestaraunts.fromJson(Map<String, dynamic> json) => LocationRestaraunts(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        location: Location.fromJson(json["location"]),
        averageCostForTwo: json["average_cost_for_two"],
        priceRange: json["price_range"],
        currency: json["currency"],
        thumb: json["thumb"],
        featuredImage: json["featured_image"],
        photosUrl: json["photos_url"],
        menuUrl: json["menu_url"],
        eventsUrl: json["events_url"],
        userRating: UserRating.fromJson(json["user_rating"]),
        hasOnlineDelivery: json["has_online_delivery"],
        isDeliveringNow: json["is_delivering_now"],
        hasTableBooking: json["has_table_booking"],
        deeplink: json["deeplink"],
        cuisines: json["cuisines"],
        allReviewsCount: json["all_reviews_count"],
        photoCount: json["photo_count"],
        phoneNumbers: json["phone_numbers"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        allReviews: List<AllReview>.from(json["all_reviews"].map((x) => AllReview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "location": location.toJson(),
        "average_cost_for_two": averageCostForTwo,
        "price_range": priceRange,
        "currency": currency,
        "thumb": thumb,
        "featured_image": featuredImage,
        "photos_url": photosUrl,
        "menu_url": menuUrl,
        "events_url": eventsUrl,
        "user_rating": userRating.toJson(),
        "has_online_delivery": hasOnlineDelivery,
        "is_delivering_now": isDeliveringNow,
        "has_table_booking": hasTableBooking,
        "deeplink": deeplink,
        "cuisines": cuisines,
        "all_reviews_count": allReviewsCount,
        "photo_count": photoCount,
        "phone_numbers": phoneNumbers,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "all_reviews": List<dynamic>.from(allReviews.map((x) => x.toJson())),
    };
}

class AllReview {
    AllReview({
        this.rating,
        this.reviewText,
        this.id,
        this.ratingColor,
        this.reviewTimeFriendly,
        this.ratingText,
        this.timestamp,
        this.likes,
        this.user,
        this.commentsCount,
    });

    String rating;
    String reviewText;
    String id;
    String ratingColor;
    String reviewTimeFriendly;
    String ratingText;
    String timestamp;
    String likes;
    User user;
    String commentsCount;

    factory AllReview.fromJson(Map<String, dynamic> json) => AllReview(
        rating: json["rating"],
        reviewText: json["review_text"],
        id: json["id"],
        ratingColor: json["rating_color"],
        reviewTimeFriendly: json["review_time_friendly"],
        ratingText: json["rating_text"],
        timestamp: json["timestamp"],
        likes: json["likes"],
        user: User.fromJson(json["user"]),
        commentsCount: json["comments_count"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "review_text": reviewText,
        "id": id,
        "rating_color": ratingColor,
        "review_time_friendly": reviewTimeFriendly,
        "rating_text": ratingText,
        "timestamp": timestamp,
        "likes": likes,
        "user": user.toJson(),
        "comments_count": commentsCount,
    };
}

class User {
    User({
        this.name,
        this.zomatoHandle,
        this.foodieLevel,
        this.foodieLevelNum,
        this.foodieColor,
        this.profileUrl,
        this.profileDeeplink,
        this.profileImage,
    });

    String name;
    String zomatoHandle;
    String foodieLevel;
    String foodieLevelNum;
    String foodieColor;
    String profileUrl;
    String profileDeeplink;
    String profileImage;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        zomatoHandle: json["zomato_handle"],
        foodieLevel: json["foodie_level"],
        foodieLevelNum: json["foodie_level_num"],
        foodieColor: json["foodie_color"],
        profileUrl: json["profile_url"],
        profileDeeplink: json["profile_deeplink"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "zomato_handle": zomatoHandle,
        "foodie_level": foodieLevel,
        "foodie_level_num": foodieLevelNum,
        "foodie_color": foodieColor,
        "profile_url": profileUrl,
        "profile_deeplink": profileDeeplink,
        "profile_image": profileImage,
    };
}

class Location {
    Location({
        this.address,
        this.locality,
        this.city,
        this.latitude,
        this.longitude,
        this.zipcode,
        this.countryId,
    });

    String address;
    String locality;
    String city;
    String latitude;
    String longitude;
    String zipcode;
    String countryId;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        locality: json["locality"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        zipcode: json["zipcode"],
        countryId: json["country_id"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "locality": locality,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "zipcode": zipcode,
        "country_id": countryId,
    };
}

class Photo {
    Photo({
        this.id,
        this.url,
        this.thumbUrl,
        this.user,
        this.resId,
        this.caption,
        this.timestamp,
        this.friendlyTime,
        this.width,
        this.height,
        this.commentsCount,
        this.likesCount,
    });

    String id;
    String url;
    String thumbUrl;
    User user;
    String resId;
    String caption;
    String timestamp;
    String friendlyTime;
    String width;
    String height;
    String commentsCount;
    String likesCount;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        url: json["url"],
        thumbUrl: json["thumb_url"],
        user: User.fromJson(json["user"]),
        resId: json["res_id"],
        caption: json["caption"],
        timestamp: json["timestamp"],
        friendlyTime: json["friendly_time"],
        width: json["width"],
        height: json["height"],
        commentsCount: json["comments_count"],
        likesCount: json["likes_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "thumb_url": thumbUrl,
        "user": user.toJson(),
        "res_id": resId,
        "caption": caption,
        "timestamp": timestamp,
        "friendly_time": friendlyTime,
        "width": width,
        "height": height,
        "comments_count": commentsCount,
        "likes_count": likesCount,
    };
}

class UserRating {
    UserRating({
        this.aggregateRating,
        this.ratingText,
        this.ratingColor,
        this.votes,
    });

    String aggregateRating;
    String ratingText;
    String ratingColor;
    String votes;

    factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        aggregateRating: json["aggregate_rating"],
        ratingText: json["rating_text"],
        ratingColor: json["rating_color"],
        votes: json["votes"],
    );

    Map<String, dynamic> toJson() => {
        "aggregate_rating": aggregateRating,
        "rating_text": ratingText,
        "rating_color": ratingColor,
        "votes": votes,
    };
}
