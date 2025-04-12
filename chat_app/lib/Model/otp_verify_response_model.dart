// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) => OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
    Data? data;
    List<Included>? included;

    OtpVerifyModel({
        this.data,
        this.included,
    });

    factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        included: json["included"] == null ? [] : List<Included>.from(json["included"]!.map((x) => Included.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "included": included == null ? [] : List<dynamic>.from(included!.map((x) => x.toJson())),
    };
}

class Data {
    String? type;
    String? id;
    DataAttributes? attributes;
    Relationships? relationships;

    Data({
        this.type,
        this.id,
        this.attributes,
        this.relationships,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        id: json["id"],
        attributes: json["attributes"] == null ? null : DataAttributes.fromJson(json["attributes"]),
        relationships: json["relationships"] == null ? null : Relationships.fromJson(json["relationships"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes?.toJson(),
        "relationships": relationships?.toJson(),
    };
}

class DataAttributes {
    String? name;
    String? username;
    String? email;
    dynamic emailVerifiedAt;
    dynamic currentTeamId;
    dynamic profilePhotoPath;
    dynamic profilePhotoId;
    DateTime? dateOfBirth;
    String? phone;
    String? gender;
    dynamic countryId;
    dynamic countryName;
    dynamic stateId;
    dynamic stateName;
    dynamic cityId;
    dynamic cityName;
    dynamic customCityName;
    String? address;
    dynamic zip;
    bool? isActive;
    int? coinBalance;
    String? customerCode;
    dynamic referralCode;
    dynamic referredBy;
    dynamic referredId;
    String? referredUserName;
    bool? isPremiumCustomer;
    bool? isOnline;
    bool? isProfilePreferencesCompleted;
    int? profileCompletionPercentage;
    int? isInstagramConnected;
    String? preferredGender;
    dynamic selfieVerificationImagePath;
    dynamic selfieVerificationImageId;
    dynamic selfieVerificationVideoPath;
    dynamic selfieVerificationVideoId;
    dynamic selfieVerificationUploadedAt;
    dynamic selfieImageApprovedAt;
    dynamic selfieImageApprovedBy;
    dynamic selfieVideoApprovedAt;
    dynamic selfieVideoApprovedBy;
    dynamic accountVerifiedAt;
    int? remainingSwipeLimit;
    DateTime? resetSwipeLimitAt;
    int? remainingSuperLikeLimit;
    DateTime? resetSuperLikeLimitAt;
    int? remainingFlashMessageLimit;
    DateTime? resetFlashMessageLimitAt;
    int? remainingBoostLimit;
    dynamic resetBoostLimitAt;
    String? currentLocation;
    String? currentLatitude;
    String? currentLongitude;
    dynamic bioIntroText;
    int? heightInCm;
    dynamic lastActiveAt;
    dynamic zodiacSignId;
    dynamic zodiacSignName;
    int? relationshipStatusId;
    String? relationshipStatusName;
    int? religionId;
    String? religionName;
    int? drinkingHabitId;
    String? drinkingHabitName;
    int? smokingHabitId;
    String? smokingHabitName;
    int? sexualOrientationId;
    String? sexualOrientationName;
    int? educationalQualificationId;
    String? educationalQualificationName;
    int? nativeLanguageId;
    String? nativeLanguageName;
    int? occupationId;
    String? occupationName;
    dynamic emotionId;
    dynamic emotionUpdatedAt;
    dynamic emotionName;
    dynamic emotionIcon;
    dynamic emotionFallbackEmoji;
    dynamic filterMyPreferredGender;
    dynamic filterPreferredGender;
    dynamic filterRadiusInKm;
    dynamic filterAgeMin;
    dynamic filterAgeMax;
    dynamic filterHeightInCmMin;
    dynamic filterHeightInCmMax;
    String? filterPassportModeLocation;
    String? filterPassportModeLatitude;
    String? filterPassportModeLongitude;
    dynamic filterNativeLanguageIds;
    dynamic filterZodiacSignIds;
    bool? isRealGiftsAccepted;
    bool? isGenderRevealed;
    bool? isHeightRevealed;
    bool? isReligionRevealed;
    bool? isDrinkingHabitRevealed;
    bool? isSmokingHabitRevealed;
    bool? isSexualOrientationRevealed;
    bool? isEducationalQualificationRevealed;
    bool? isPersonalityTraitsRevealed;
    bool? isLifestyleActivitiesRevealed;
    bool? isContactDiscoveryEnabled;
    bool? isGhostModeEnabled;
    bool? isDarkModeEnabled;
    bool? isReceivingPushNotifications;
    bool? isReceivingFlashMessages;
    bool? isLastSeenEnabled;
    bool? isOnlineStatusEnabled;
    bool? isReadReceiptsEnabled;
    bool? isProfileHiddenFromSearch;
    dynamic hiddenFromSearchAt;
    bool? isProfileReported;
    dynamic reportedAt;
    bool? isProfileStriked;
    dynamic strikedAt;
    bool? isProfileBlacklisted;
    dynamic blacklistedAt;
    bool? isAccountSuspended;
    dynamic suspendedAt;
    dynamic createdBy;
    dynamic createdByName;
    int? updatedBy;
    String? updatedByName;
    dynamic deletedBy;
    dynamic deletedByName;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    AuthStatus? authStatus;
    String? profilePhotoUrl;
    String? square100ProfilePhotoUrl;
    String? square300ProfilePhotoUrl;
    String? square500ProfilePhotoUrl;
    int? age;

    DataAttributes({
        this.name,
        this.username,
        this.email,
        this.emailVerifiedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.profilePhotoId,
        this.dateOfBirth,
        this.phone,
        this.gender,
        this.countryId,
        this.countryName,
        this.stateId,
        this.stateName,
        this.cityId,
        this.cityName,
        this.customCityName,
        this.address,
        this.zip,
        this.isActive,
        this.coinBalance,
        this.customerCode,
        this.referralCode,
        this.referredBy,
        this.referredId,
        this.referredUserName,
        this.isPremiumCustomer,
        this.isOnline,
        this.isProfilePreferencesCompleted,
        this.profileCompletionPercentage,
        this.isInstagramConnected,
        this.preferredGender,
        this.selfieVerificationImagePath,
        this.selfieVerificationImageId,
        this.selfieVerificationVideoPath,
        this.selfieVerificationVideoId,
        this.selfieVerificationUploadedAt,
        this.selfieImageApprovedAt,
        this.selfieImageApprovedBy,
        this.selfieVideoApprovedAt,
        this.selfieVideoApprovedBy,
        this.accountVerifiedAt,
        this.remainingSwipeLimit,
        this.resetSwipeLimitAt,
        this.remainingSuperLikeLimit,
        this.resetSuperLikeLimitAt,
        this.remainingFlashMessageLimit,
        this.resetFlashMessageLimitAt,
        this.remainingBoostLimit,
        this.resetBoostLimitAt,
        this.currentLocation,
        this.currentLatitude,
        this.currentLongitude,
        this.bioIntroText,
        this.heightInCm,
        this.lastActiveAt,
        this.zodiacSignId,
        this.zodiacSignName,
        this.relationshipStatusId,
        this.relationshipStatusName,
        this.religionId,
        this.religionName,
        this.drinkingHabitId,
        this.drinkingHabitName,
        this.smokingHabitId,
        this.smokingHabitName,
        this.sexualOrientationId,
        this.sexualOrientationName,
        this.educationalQualificationId,
        this.educationalQualificationName,
        this.nativeLanguageId,
        this.nativeLanguageName,
        this.occupationId,
        this.occupationName,
        this.emotionId,
        this.emotionUpdatedAt,
        this.emotionName,
        this.emotionIcon,
        this.emotionFallbackEmoji,
        this.filterMyPreferredGender,
        this.filterPreferredGender,
        this.filterRadiusInKm,
        this.filterAgeMin,
        this.filterAgeMax,
        this.filterHeightInCmMin,
        this.filterHeightInCmMax,
        this.filterPassportModeLocation,
        this.filterPassportModeLatitude,
        this.filterPassportModeLongitude,
        this.filterNativeLanguageIds,
        this.filterZodiacSignIds,
        this.isRealGiftsAccepted,
        this.isGenderRevealed,
        this.isHeightRevealed,
        this.isReligionRevealed,
        this.isDrinkingHabitRevealed,
        this.isSmokingHabitRevealed,
        this.isSexualOrientationRevealed,
        this.isEducationalQualificationRevealed,
        this.isPersonalityTraitsRevealed,
        this.isLifestyleActivitiesRevealed,
        this.isContactDiscoveryEnabled,
        this.isGhostModeEnabled,
        this.isDarkModeEnabled,
        this.isReceivingPushNotifications,
        this.isReceivingFlashMessages,
        this.isLastSeenEnabled,
        this.isOnlineStatusEnabled,
        this.isReadReceiptsEnabled,
        this.isProfileHiddenFromSearch,
        this.hiddenFromSearchAt,
        this.isProfileReported,
        this.reportedAt,
        this.isProfileStriked,
        this.strikedAt,
        this.isProfileBlacklisted,
        this.blacklistedAt,
        this.isAccountSuspended,
        this.suspendedAt,
        this.createdBy,
        this.createdByName,
        this.updatedBy,
        this.updatedByName,
        this.deletedBy,
        this.deletedByName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.authStatus,
        this.profilePhotoUrl,
        this.square100ProfilePhotoUrl,
        this.square300ProfilePhotoUrl,
        this.square500ProfilePhotoUrl,
        this.age,
    });

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoId: json["profile_photo_id"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        phone: json["phone"],
        gender: json["gender"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        stateId: json["state_id"],
        stateName: json["state_name"],
        cityId: json["city_id"],
        cityName: json["city_name"],
        customCityName: json["custom_city_name"],
        address: json["address"],
        zip: json["zip"],
        isActive: json["is_active"],
        coinBalance: json["coin_balance"],
        customerCode: json["customer_code"],
        referralCode: json["referral_code"],
        referredBy: json["referred_by"],
        referredId: json["referred_id"],
        referredUserName: json["referred_user_name"],
        isPremiumCustomer: json["is_premium_customer"],
        isOnline: json["is_online"],
        isProfilePreferencesCompleted: json["is_profile_preferences_completed"],
        profileCompletionPercentage: json["profile_completion_percentage"],
        isInstagramConnected: json["is_instagram_connected"],
        preferredGender: json["preferred_gender"],
        selfieVerificationImagePath: json["selfie_verification_image_path"],
        selfieVerificationImageId: json["selfie_verification_image_id"],
        selfieVerificationVideoPath: json["selfie_verification_video_path"],
        selfieVerificationVideoId: json["selfie_verification_video_id"],
        selfieVerificationUploadedAt: json["selfie_verification_uploaded_at"],
        selfieImageApprovedAt: json["selfie_image_approved_at"],
        selfieImageApprovedBy: json["selfie_image_approved_by"],
        selfieVideoApprovedAt: json["selfie_video_approved_at"],
        selfieVideoApprovedBy: json["selfie_video_approved_by"],
        accountVerifiedAt: json["account_verified_at"],
        remainingSwipeLimit: json["remaining_swipe_limit"],
        resetSwipeLimitAt: json["reset_swipe_limit_at"] == null ? null : DateTime.parse(json["reset_swipe_limit_at"]),
        remainingSuperLikeLimit: json["remaining_super_like_limit"],
        resetSuperLikeLimitAt: json["reset_super_like_limit_at"] == null ? null : DateTime.parse(json["reset_super_like_limit_at"]),
        remainingFlashMessageLimit: json["remaining_flash_message_limit"],
        resetFlashMessageLimitAt: json["reset_flash_message_limit_at"] == null ? null : DateTime.parse(json["reset_flash_message_limit_at"]),
        remainingBoostLimit: json["remaining_boost_limit"],
        resetBoostLimitAt: json["reset_boost_limit_at"],
        currentLocation: json["current_location"],
        currentLatitude: json["current_latitude"],
        currentLongitude: json["current_longitude"],
        bioIntroText: json["bio_intro_text"],
        heightInCm: json["height_in_cm"],
        lastActiveAt: json["last_active_at"],
        zodiacSignId: json["zodiac_sign_id"],
        zodiacSignName: json["zodiac_sign_name"],
        relationshipStatusId: json["relationship_status_id"],
        relationshipStatusName: json["relationship_status_name"],
        religionId: json["religion_id"],
        religionName: json["religion_name"],
        drinkingHabitId: json["drinking_habit_id"],
        drinkingHabitName: json["drinking_habit_name"],
        smokingHabitId: json["smoking_habit_id"],
        smokingHabitName: json["smoking_habit_name"],
        sexualOrientationId: json["sexual_orientation_id"],
        sexualOrientationName: json["sexual_orientation_name"],
        educationalQualificationId: json["educational_qualification_id"],
        educationalQualificationName: json["educational_qualification_name"],
        nativeLanguageId: json["native_language_id"],
        nativeLanguageName: json["native_language_name"],
        occupationId: json["occupation_id"],
        occupationName: json["occupation_name"],
        emotionId: json["emotion_id"],
        emotionUpdatedAt: json["emotion_updated_at"],
        emotionName: json["emotion_name"],
        emotionIcon: json["emotion_icon"],
        emotionFallbackEmoji: json["emotion_fallback_emoji"],
        filterMyPreferredGender: json["filter_my_preferred_gender"],
        filterPreferredGender: json["filter_preferred_gender"],
        filterRadiusInKm: json["filter_radius_in_km"],
        filterAgeMin: json["filter_age_min"],
        filterAgeMax: json["filter_age_max"],
        filterHeightInCmMin: json["filter_height_in_cm_min"],
        filterHeightInCmMax: json["filter_height_in_cm_max"],
        filterPassportModeLocation: json["filter_passport_mode_location"],
        filterPassportModeLatitude: json["filter_passport_mode_latitude"],
        filterPassportModeLongitude: json["filter_passport_mode_longitude"],
        filterNativeLanguageIds: json["filter_native_language_ids"],
        filterZodiacSignIds: json["filter_zodiac_sign_ids"],
        isRealGiftsAccepted: json["is_real_gifts_accepted"],
        isGenderRevealed: json["is_gender_revealed"],
        isHeightRevealed: json["is_height_revealed"],
        isReligionRevealed: json["is_religion_revealed"],
        isDrinkingHabitRevealed: json["is_drinking_habit_revealed"],
        isSmokingHabitRevealed: json["is_smoking_habit_revealed"],
        isSexualOrientationRevealed: json["is_sexual_orientation_revealed"],
        isEducationalQualificationRevealed: json["is_educational_qualification_revealed"],
        isPersonalityTraitsRevealed: json["is_personality_traits_revealed"],
        isLifestyleActivitiesRevealed: json["is_lifestyle_activities_revealed"],
        isContactDiscoveryEnabled: json["is_contact_discovery_enabled"],
        isGhostModeEnabled: json["is_ghost_mode_enabled"],
        isDarkModeEnabled: json["is_dark_mode_enabled"],
        isReceivingPushNotifications: json["is_receiving_push_notifications"],
        isReceivingFlashMessages: json["is_receiving_flash_messages"],
        isLastSeenEnabled: json["is_last_seen_enabled"],
        isOnlineStatusEnabled: json["is_online_status_enabled"],
        isReadReceiptsEnabled: json["is_read_receipts_enabled"],
        isProfileHiddenFromSearch: json["is_profile_hidden_from_search"],
        hiddenFromSearchAt: json["hidden_from_search_at"],
        isProfileReported: json["is_profile_reported"],
        reportedAt: json["reported_at"],
        isProfileStriked: json["is_profile_striked"],
        strikedAt: json["striked_at"],
        isProfileBlacklisted: json["is_profile_blacklisted"],
        blacklistedAt: json["blacklisted_at"],
        isAccountSuspended: json["is_account_suspended"],
        suspendedAt: json["suspended_at"],
        createdBy: json["created_by"],
        createdByName: json["created_by_name"],
        updatedBy: json["updated_by"],
        updatedByName: json["updated_by_name"],
        deletedBy: json["deleted_by"],
        deletedByName: json["deleted_by_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        authStatus: json["auth_status"] == null ? null : AuthStatus.fromJson(json["auth_status"]),
        profilePhotoUrl: json["profile_photo_url"],
        square100ProfilePhotoUrl: json["square100_profile_photo_url"],
        square300ProfilePhotoUrl: json["square300_profile_photo_url"],
        square500ProfilePhotoUrl: json["square500_profile_photo_url"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_id": profilePhotoId,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "gender": gender,
        "country_id": countryId,
        "country_name": countryName,
        "state_id": stateId,
        "state_name": stateName,
        "city_id": cityId,
        "city_name": cityName,
        "custom_city_name": customCityName,
        "address": address,
        "zip": zip,
        "is_active": isActive,
        "coin_balance": coinBalance,
        "customer_code": customerCode,
        "referral_code": referralCode,
        "referred_by": referredBy,
        "referred_id": referredId,
        "referred_user_name": referredUserName,
        "is_premium_customer": isPremiumCustomer,
        "is_online": isOnline,
        "is_profile_preferences_completed": isProfilePreferencesCompleted,
        "profile_completion_percentage": profileCompletionPercentage,
        "is_instagram_connected": isInstagramConnected,
        "preferred_gender": preferredGender,
        "selfie_verification_image_path": selfieVerificationImagePath,
        "selfie_verification_image_id": selfieVerificationImageId,
        "selfie_verification_video_path": selfieVerificationVideoPath,
        "selfie_verification_video_id": selfieVerificationVideoId,
        "selfie_verification_uploaded_at": selfieVerificationUploadedAt,
        "selfie_image_approved_at": selfieImageApprovedAt,
        "selfie_image_approved_by": selfieImageApprovedBy,
        "selfie_video_approved_at": selfieVideoApprovedAt,
        "selfie_video_approved_by": selfieVideoApprovedBy,
        "account_verified_at": accountVerifiedAt,
        "remaining_swipe_limit": remainingSwipeLimit,
        "reset_swipe_limit_at": resetSwipeLimitAt?.toIso8601String(),
        "remaining_super_like_limit": remainingSuperLikeLimit,
        "reset_super_like_limit_at": resetSuperLikeLimitAt?.toIso8601String(),
        "remaining_flash_message_limit": remainingFlashMessageLimit,
        "reset_flash_message_limit_at": resetFlashMessageLimitAt?.toIso8601String(),
        "remaining_boost_limit": remainingBoostLimit,
        "reset_boost_limit_at": resetBoostLimitAt,
        "current_location": currentLocation,
        "current_latitude": currentLatitude,
        "current_longitude": currentLongitude,
        "bio_intro_text": bioIntroText,
        "height_in_cm": heightInCm,
        "last_active_at": lastActiveAt,
        "zodiac_sign_id": zodiacSignId,
        "zodiac_sign_name": zodiacSignName,
        "relationship_status_id": relationshipStatusId,
        "relationship_status_name": relationshipStatusName,
        "religion_id": religionId,
        "religion_name": religionName,
        "drinking_habit_id": drinkingHabitId,
        "drinking_habit_name": drinkingHabitName,
        "smoking_habit_id": smokingHabitId,
        "smoking_habit_name": smokingHabitName,
        "sexual_orientation_id": sexualOrientationId,
        "sexual_orientation_name": sexualOrientationName,
        "educational_qualification_id": educationalQualificationId,
        "educational_qualification_name": educationalQualificationName,
        "native_language_id": nativeLanguageId,
        "native_language_name": nativeLanguageName,
        "occupation_id": occupationId,
        "occupation_name": occupationName,
        "emotion_id": emotionId,
        "emotion_updated_at": emotionUpdatedAt,
        "emotion_name": emotionName,
        "emotion_icon": emotionIcon,
        "emotion_fallback_emoji": emotionFallbackEmoji,
        "filter_my_preferred_gender": filterMyPreferredGender,
        "filter_preferred_gender": filterPreferredGender,
        "filter_radius_in_km": filterRadiusInKm,
        "filter_age_min": filterAgeMin,
        "filter_age_max": filterAgeMax,
        "filter_height_in_cm_min": filterHeightInCmMin,
        "filter_height_in_cm_max": filterHeightInCmMax,
        "filter_passport_mode_location": filterPassportModeLocation,
        "filter_passport_mode_latitude": filterPassportModeLatitude,
        "filter_passport_mode_longitude": filterPassportModeLongitude,
        "filter_native_language_ids": filterNativeLanguageIds,
        "filter_zodiac_sign_ids": filterZodiacSignIds,
        "is_real_gifts_accepted": isRealGiftsAccepted,
        "is_gender_revealed": isGenderRevealed,
        "is_height_revealed": isHeightRevealed,
        "is_religion_revealed": isReligionRevealed,
        "is_drinking_habit_revealed": isDrinkingHabitRevealed,
        "is_smoking_habit_revealed": isSmokingHabitRevealed,
        "is_sexual_orientation_revealed": isSexualOrientationRevealed,
        "is_educational_qualification_revealed": isEducationalQualificationRevealed,
        "is_personality_traits_revealed": isPersonalityTraitsRevealed,
        "is_lifestyle_activities_revealed": isLifestyleActivitiesRevealed,
        "is_contact_discovery_enabled": isContactDiscoveryEnabled,
        "is_ghost_mode_enabled": isGhostModeEnabled,
        "is_dark_mode_enabled": isDarkModeEnabled,
        "is_receiving_push_notifications": isReceivingPushNotifications,
        "is_receiving_flash_messages": isReceivingFlashMessages,
        "is_last_seen_enabled": isLastSeenEnabled,
        "is_online_status_enabled": isOnlineStatusEnabled,
        "is_read_receipts_enabled": isReadReceiptsEnabled,
        "is_profile_hidden_from_search": isProfileHiddenFromSearch,
        "hidden_from_search_at": hiddenFromSearchAt,
        "is_profile_reported": isProfileReported,
        "reported_at": reportedAt,
        "is_profile_striked": isProfileStriked,
        "striked_at": strikedAt,
        "is_profile_blacklisted": isProfileBlacklisted,
        "blacklisted_at": blacklistedAt,
        "is_account_suspended": isAccountSuspended,
        "suspended_at": suspendedAt,
        "created_by": createdBy,
        "created_by_name": createdByName,
        "updated_by": updatedBy,
        "updated_by_name": updatedByName,
        "deleted_by": deletedBy,
        "deleted_by_name": deletedByName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "auth_status": authStatus?.toJson(),
        "profile_photo_url": profilePhotoUrl,
        "square100_profile_photo_url": square100ProfilePhotoUrl,
        "square300_profile_photo_url": square300ProfilePhotoUrl,
        "square500_profile_photo_url": square500ProfilePhotoUrl,
        "age": age,
    };
}

class AuthStatus {
    String? accessToken;
    String? tokenType;
    bool? is2FaConfiguredByUser;
    bool? is2FaVerifiedByUser;
    bool? isEmailVerificationRequired;

    AuthStatus({
        this.accessToken,
        this.tokenType,
        this.is2FaConfiguredByUser,
        this.is2FaVerifiedByUser,
        this.isEmailVerificationRequired,
    });

    factory AuthStatus.fromJson(Map<String, dynamic> json) => AuthStatus(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        is2FaConfiguredByUser: json["is_2fa_configured_by_user"],
        is2FaVerifiedByUser: json["is_2fa_verified_by_user"],
        isEmailVerificationRequired: json["is_email_verification_required"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "is_2fa_configured_by_user": is2FaConfiguredByUser,
        "is_2fa_verified_by_user": is2FaVerifiedByUser,
        "is_email_verification_required": isEmailVerificationRequired,
    };
}

class Relationships {
    Avatars? partnerExpectations;
    Avatars? lifeStyleActivities;
    Avatars? personalityTraits;
    Avatars? avatars;
    Avatars? userIdentityProof;

    Relationships({
        this.partnerExpectations,
        this.lifeStyleActivities,
        this.personalityTraits,
        this.avatars,
        this.userIdentityProof,
    });

    factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        partnerExpectations: json["partnerExpectations"] == null ? null : Avatars.fromJson(json["partnerExpectations"]),
        lifeStyleActivities: json["lifeStyleActivities"] == null ? null : Avatars.fromJson(json["lifeStyleActivities"]),
        personalityTraits: json["personalityTraits"] == null ? null : Avatars.fromJson(json["personalityTraits"]),
        avatars: json["avatars"] == null ? null : Avatars.fromJson(json["avatars"]),
        userIdentityProof: json["userIdentityProof"] == null ? null : Avatars.fromJson(json["userIdentityProof"]),
    );

    Map<String, dynamic> toJson() => {
        "partnerExpectations": partnerExpectations?.toJson(),
        "lifeStyleActivities": lifeStyleActivities?.toJson(),
        "personalityTraits": personalityTraits?.toJson(),
        "avatars": avatars?.toJson(),
        "userIdentityProof": userIdentityProof?.toJson(),
    };
}

class Avatars {
    List<Datum>? data;

    Avatars({
        this.data,
    });

    factory Avatars.fromJson(Map<String, dynamic> json) => Avatars(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? type;
    String? id;

    Datum({
        this.type,
        this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
    };
}

class Included {
    String? type;
    String? id;
    IncludedAttributes? attributes;

    Included({
        this.type,
        this.id,
        this.attributes,
    });

    factory Included.fromJson(Map<String, dynamic> json) => Included(
        type: json["type"],
        id: json["id"],
        attributes: json["attributes"] == null ? null : IncludedAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes?.toJson(),
    };
}

class IncludedAttributes {
    String? name;
    String? icon;
    int? traitTypeId;
    int? createdBy;
    int? updatedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? laravelThroughKey;
    String? iconUrl;
    int? userId;
    bool? isActive;
    DateTime? approvedAt;
    int? approvedBy;
    dynamic deletedAt;
    String? imageUrl;
    String? square100ImageUrl;
    String? square300ImageUrl;
    String? square500ImageUrl;

    IncludedAttributes({
        this.name,
        this.icon,
        this.traitTypeId,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.laravelThroughKey,
        this.iconUrl,
        this.userId,
        this.isActive,
        this.approvedAt,
        this.approvedBy,
        this.deletedAt,
        this.imageUrl,
        this.square100ImageUrl,
        this.square300ImageUrl,
        this.square500ImageUrl,
    });

    factory IncludedAttributes.fromJson(Map<String, dynamic> json) => IncludedAttributes(
        name: json["name"],
        icon: json["icon"],
        traitTypeId: json["trait_type_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        laravelThroughKey: json["laravel_through_key"],
        iconUrl: json["icon_url"],
        userId: json["user_id"],
        isActive: json["is_active"],
        approvedAt: json["approved_at"] == null ? null : DateTime.parse(json["approved_at"]),
        approvedBy: json["approved_by"],
        deletedAt: json["deleted_at"],
        imageUrl: json["image_url"],
        square100ImageUrl: json["square100_image_url"],
        square300ImageUrl: json["square300_image_url"],
        square500ImageUrl: json["square500_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "trait_type_id": traitTypeId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "laravel_through_key": laravelThroughKey,
        "icon_url": iconUrl,
        "user_id": userId,
        "is_active": isActive,
        "approved_at": approvedAt?.toIso8601String(),
        "approved_by": approvedBy,
        "deleted_at": deletedAt,
        "image_url": imageUrl,
        "square100_image_url": square100ImageUrl,
        "square300_image_url": square300ImageUrl,
        "square500_image_url": square500ImageUrl,
    };
}
