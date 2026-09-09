package com.autozen.car.presentation

import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.autozen.car.presentation.components.BannerAdView
import com.autozen.car.util.SubscriptionLevel
import com.autozen.car.util.SubscriptionManager
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            MaterialTheme(
                colorScheme = darkColorScheme(
                    primary = Color(0xFF1E88E5),
                    secondary = Color(0xFF00ACC1),
                    background = Color(0xFF0F172A),
                    surface = Color(0xFF1E293B),
                    onPrimary = Color.White
                )
            ) {
                AutoZenMainContent()
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AutoZenMainContent() {
    val context = LocalContext.current
    val subManager = remember { SubscriptionManager(context) }
    var currentSubLevel by remember { mutableStateOf(subManager.getSubscriptionLevel()) }

    var selectedNavTab by remember { mutableIntStateOf(0) }
    var secretTaps by remember { mutableIntStateOf(0) }
    var showSubscriptionDialog by remember { mutableStateOf(false) }

    val snackbarHostState = remember { SnackbarHostState() }
    val coroutineScope = rememberCoroutineScope()

    val showMessage: (String) -> Unit = { msg ->
        coroutineScope.launch {
            snackbarHostState.showSnackbar(msg)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                secretTaps += 1
                                if (secretTaps >= 3) {
                                    secretTaps = 0
                                    showSubscriptionDialog = true
                                }
                            },
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.DirectionsCar,
                            contentDescription = "AutoZen Logo",
                            tint = Color(0xFF38BDF8),
                            modifier = Modifier.size(28.dp)
                        )
                        Spacer(modifier = Modifier.width(10.dp))
                        Column {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text(
                                    text = "AutoZen Car Launcher",
                                    fontWeight = FontWeight.ExtraBold,
                                    fontSize = 18.sp,
                                    color = Color.White
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                when (currentSubLevel) {
                                    SubscriptionLevel.PRO -> {
                                        Surface(
                                            color = Color(0xFFFFD54F),
                                            shape = MaterialTheme.shapes.extraSmall
                                        ) {
                                            Row(
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                                verticalAlignment = Alignment.CenterVertically
                                            ) {
                                                Icon(Icons.Default.Star, contentDescription = null, tint = Color.Black, modifier = Modifier.size(12.dp))
                                                Spacer(modifier = Modifier.width(2.dp))
                                                Text("PRO", color = Color.Black, fontSize = 10.sp, fontWeight = FontWeight.ExtraBold)
                                            }
                                        }
                                    }
                                    SubscriptionLevel.VIP -> {
                                        Surface(
                                            color = Color(0xFF00E5FF),
                                            shape = MaterialTheme.shapes.extraSmall
                                        ) {
                                            Row(
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                                verticalAlignment = Alignment.CenterVertically
                                            ) {
                                                Icon(Icons.Default.Diamond, contentDescription = null, tint = Color.Black, modifier = Modifier.size(12.dp))
                                                Spacer(modifier = Modifier.width(2.dp))
                                                Text("VIP FLOTILLA", color = Color.Black, fontSize = 10.sp, fontWeight = FontWeight.ExtraBold)
                                            }
                                        }
                                    }
                                    else -> {}
                                }
                            }
                            Text(
                                text = "Navegación & Asistente Automotriz (Toca 3 veces para probar planes)",
                                fontSize = 11.sp,
                                color = Color.LightGray
                            )
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(containerColor = Color(0xFF1E293B))
            )
        },
        bottomBar = {
            NavigationBar(containerColor = Color(0xFF1E293B)) {
                NavigationBarItem(
                    selected = selectedNavTab == 0,
                    onClick = { selectedNavTab = 0 },
                    icon = { Icon(Icons.Default.Dashboard, contentDescription = "Tablero") },
                    label = { Text("Tablero AutoZen") }
                )
                NavigationBarItem(
                    selected = selectedNavTab == 1,
                    onClick = { selectedNavTab = 1 },
                    icon = { Icon(Icons.Default.Navigation, contentDescription = "Mapas & GPS") },
                    label = { Text("Navegación GPS") }
                )
                NavigationBarItem(
                    selected = selectedNavTab == 2,
                    onClick = { selectedNavTab = 2 },
                    icon = { Icon(Icons.Default.MusicNote, contentDescription = "Música") },
                    label = { Text("Multimedia") }
                )
            }
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
                .background(Color(0xFF0F172A))
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            when (selectedNavTab) {
                0 -> AutoZenDashboard(currentSubLevel)
                1 -> AutoZenNavigationScreen()
                2 -> AutoZenMediaScreen()
            }

            Spacer(modifier = Modifier.weight(1f))

            BannerAdView(subscriptionLevel = currentSubLevel)
        }
    }

    if (showSubscriptionDialog) {
        AlertDialog(
            onDismissRequest = { showSubscriptionDialog = false },
            title = {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(Icons.Default.DirectionsCar, contentDescription = null, tint = Color(0xFF38BDF8))
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("🚗 Planes AutoZen Car Launcher", fontWeight = FontWeight.Bold)
                }
            },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text(
                        text = "Selecciona un tipo de suscripción para probar la interfaz del auto. La opción elegida se guardará en memoria.",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Spacer(modifier = Modifier.height(4.dp))

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.FREE)
                            currentSubLevel = SubscriptionLevel.FREE
                            showSubscriptionDialog = false
                            showMessage("Modo AutoZen Gratuito (Con anuncios de banner)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color.DarkGray),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("1. PLAN GRATUITO (Banners Activos)")
                    }

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.PRO)
                            currentSubLevel = SubscriptionLevel.PRO
                            showSubscriptionDialog = false
                            showMessage("⭐️ Plan AutoZen PRO Activado (Sin anuncios + Insignia Dorada)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFF57F17)),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(Icons.Default.Star, contentDescription = null, tint = Color.White)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("2. PLAN AUTOZEN PRO (Sin Anuncios)")
                        }
                    }

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.VIP)
                            currentSubLevel = SubscriptionLevel.VIP
                            showSubscriptionDialog = false
                            showMessage("💎 Plan VIP AutoZen Flotilla (Interfaz Exclusiva)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF0097A7)),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(Icons.Default.Diamond, contentDescription = null, tint = Color.White)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("3. PLAN VIP FLOTILLA AUTOZEN")
                        }
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { showSubscriptionDialog = false }) {
                    Text("CERRAR")
                }
            }
        )
    }
}

@Composable
fun AutoZenDashboard(subscriptionLevel: SubscriptionLevel) {
    Card(
        colors = CardDefaults.cardColors(containerColor = Color(0xFF1E293B)),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "VELOCÍMETRO DIGITAL AUTOZEN",
                fontSize = 12.sp,
                fontWeight = FontWeight.Bold,
                color = Color(0xFF94A3B8)
            )
            Spacer(modifier = Modifier.height(10.dp))
            Text(
                text = "0 km/h",
                fontSize = 48.sp,
                fontWeight = FontWeight.ExtraBold,
                color = if (subscriptionLevel == SubscriptionLevel.VIP) Color(0xFF00E5FF) else Color(0xFF38BDF8)
            )
            Text(
                text = "Vehículo Detenido | GPS Conectado",
                fontSize = 12.sp,
                color = Color.LightGray
            )
        }
    }
}

@Composable
fun AutoZenNavigationScreen() {
    Card(
        colors = CardDefaults.cardColors(containerColor = Color(0xFF1E293B)),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Default.Navigation, contentDescription = null, tint = Color(0xFF38BDF8))
                Spacer(modifier = Modifier.width(8.dp))
                Text("Navegación Asistida AutoZen", fontWeight = FontWeight.Bold, color = Color.White)
            }
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Rutas inteligentes, alerta de radares y límites de velocidad listos para conducir.",
                fontSize = 12.sp,
                color = Color.LightGray
            )
        }
    }
}

@Composable
fun AutoZenMediaScreen() {
    Card(
        colors = CardDefaults.cardColors(containerColor = Color(0xFF1E293B)),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Default.MusicNote, contentDescription = null, tint = Color(0xFF38BDF8))
                Spacer(modifier = Modifier.width(8.dp))
                Text("Control Multimedia Automotriz", fontWeight = FontWeight.Bold, color = Color.White)
            }
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Integración con reproductores de música y llamadas manos libres.",
                fontSize = 12.sp,
                color = Color.LightGray
            )
        }
    }
}
