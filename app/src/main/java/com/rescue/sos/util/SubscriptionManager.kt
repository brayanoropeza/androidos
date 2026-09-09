package com.rescue.sos.util

import android.content.Context
import android.content.SharedPreferences

enum class SubscriptionLevel {
    FREE,
    PRO,
    VIP
}

class SubscriptionManager(context: Context) {
    private val prefs: SharedPreferences = context.getSharedPreferences("autozen_subscription_prefs", Context.MODE_PRIVATE)

    companion object {
        private const val KEY_SUBSCRIPTION_LEVEL = "key_subscription_level"
    }

    fun getSubscriptionLevel(): SubscriptionLevel {
        val levelName = prefs.getString(KEY_SUBSCRIPTION_LEVEL, SubscriptionLevel.FREE.name)
        return try {
            SubscriptionLevel.valueOf(levelName ?: SubscriptionLevel.FREE.name)
        } catch (e: Exception) {
            SubscriptionLevel.FREE
        }
    }

    fun setSubscriptionLevel(level: SubscriptionLevel) {
        prefs.edit().putString(KEY_SUBSCRIPTION_LEVEL, level.name).apply()
    }

    fun clearSubscription() {
        prefs.edit().remove(KEY_SUBSCRIPTION_LEVEL).apply()
    }
}
