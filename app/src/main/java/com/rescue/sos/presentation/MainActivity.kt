package com.rescue.sos.presentation

import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CellTower
import androidx.compose.material.icons.filled.Diamond
import androidx.compose.material.icons.filled.DirectionsCar
import androidx.compose.material.icons.filled.MedicalServices
import androidx.compose.material.icons.filled.Navigation
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.rescue.sos.presentation.components.PermissionHandler
import com.rescue.sos.presentation.rescuer.RescuerScreen
import com.rescue.sos.presentation.victim.VictimScreen
import com.rescue.sos.util.SubscriptionLevel
import com.rescue.sos.util.SubscriptionManager
import kotlinx.coroutines.launch
import java.util.UUID

class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val victimId = "VICTIMA_${Build.MODEL.take(5).replace(" ", "_")}_${UUID.randomUUID().toString().take(4)}"

        setContent {
            MaterialTheme(
                colorScheme = darkColorScheme(
                    primary = Color(0xFFD32F2F),
                    secondary = Color(0xFF1976D2),
                    background = Color(0xFF121212),
                    surface = Color(0xFF1E1E1E),
                    onPrimary = Color.White
                )
            ) {
                PermissionHandler(
                    onPermissionsGranted = { /* Continuar normalmente */ }
                ) {
                    MainAppContent(victimId = victimId)
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MainAppContent(victimId: String) {
    val context = LocalContext.current
    val subManager = remember { SubscriptionManager(context) }
    var currentSubLevel by remember { mutableStateOf(subManager.getSubscriptionLevel()) }

    var selectedTab by remember { mutableStateOf(0) }
    val snackbarHostState = remember { SnackbarHostState() }
    val coroutineScope = rememberCoroutineScope()

    var secretTaps by remember { mutableIntStateOf(0) }
    var showSubscriptionDialog by remember { mutableStateOf(false) }

    val showMessage: (String) -> Unit = { message ->
        coroutineScope.launch {
            snackbarHostState.showSnackbar(
                message = message,
                duration = SnackbarDuration.Short
            )
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                secretTaps += 1
                                if (secretTaps >= 3) {
                                    secretTaps = 0
                                    showSubscriptionDialog = true
                                }
                            }
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.DirectionsCar,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = "AutoZen Car Launcher",
                                fontWeight = FontWeight.Bold
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            when (currentSubLevel) {
                                SubscriptionLevel.PRO -> {
                                    Surface(
                                        color = Color(0xFFFFD54F),
                                        shape = MaterialTheme.shapes.extraSmall
                                    ) {
                                        Row(
                                            modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp),
                                            verticalAlignment = Alignment.CenterVertically
                                        ) {
                                            Icon(Icons.Default.Star, contentDescription = null, tint = Color.Black, modifier = Modifier.size(10.dp))
                                            Spacer(modifier = Modifier.width(2.dp))
                                            Text("PRO", color = Color.Black, fontSize = 9.sp, fontWeight = FontWeight.Bold)
                                        }
                                    }
                                }
                                SubscriptionLevel.VIP -> {
                                    Surface(
                                        color = Color(0xFF00E5FF),
                                        shape = MaterialTheme.shapes.extraSmall
                                    ) {
                                        Row(
                                            modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp),
                                            verticalAlignment = Alignment.CenterVertically
                                        ) {
                                            Icon(Icons.Default.Diamond, contentDescription = null, tint = Color.Black, modifier = Modifier.size(10.dp))
                                            Spacer(modifier = Modifier.width(2.dp))
                                            Text("VIP", color = Color.Black, fontSize = 9.sp, fontWeight = FontWeight.Bold)
                                        }
                                    }
                                }
                                else -> {}
                            }
                        }
                        Text(
                            text = "Car Assistant & Navigation (Toca 3 veces para suscripciones)",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.outline
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface
                )
            )
        },
        bottomBar = {
            NavigationBar(
                containerColor = MaterialTheme.colorScheme.surface
            ) {
                NavigationBarItem(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    icon = { Icon(Icons.Default.DirectionsCar, contentDescription = "Modo Conducción") },
                    label = { Text("AutoZen Drive") }
                )
                NavigationBarItem(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    icon = { Icon(Icons.Default.Navigation, contentDescription = "Navegación & Mapas") },
                    label = { Text("Navegación") }
                )
            }
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { innerPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            when (selectedTab) {
                0 -> VictimScreen(
                    victimId = victimId,
                    subscriptionLevel = currentSubLevel,
                    onSubscriptionChange = { newLevel ->
                        subManager.setSubscriptionLevel(newLevel)
                        currentSubLevel = newLevel
                    },
                    onStatusMessage = showMessage
                )
                1 -> RescuerScreen(onStatusMessage = showMessage)
            }
        }
    }

    if (showSubscriptionDialog) {
        AlertDialog(
            onDismissRequest = { showSubscriptionDialog = false },
            title = {
                Text("🛠️ Menú Secreto de Pruebas: Suscripciones", fontWeight = FontWeight.Bold)
            },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text(
                        text = "Elige un tipo de suscripción para probar la interfaz. El estado se guardará en memoria incluso al cerrar y reabrir la app.",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Spacer(modifier = Modifier.height(4.dp))

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.FREE)
                            currentSubLevel = SubscriptionLevel.FREE
                            showSubscriptionDialog = false
                            showMessage("Suscripción cambiada a: FREE (Gratuita con anuncios)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color.DarkGray),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("1. PLAN FREE (BÁSICO CON ANUNCIOS)")
                    }

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.PRO)
                            currentSubLevel = SubscriptionLevel.PRO
                            showSubscriptionDialog = false
                            showMessage("Suscripción cambiada a: PRO (Sin anuncios + Insignia Dorada)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFF57F17)),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(Icons.Default.Star, contentDescription = null, tint = Color.White)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("2. PLAN PRO (SIN ANUNCIOS)")
                        }
                    }

                    Button(
                        onClick = {
                            subManager.setSubscriptionLevel(SubscriptionLevel.VIP)
                            currentSubLevel = SubscriptionLevel.VIP
                            showSubscriptionDialog = false
                            showMessage("Suscripción cambiada a: VIP (Empresarial/Flotilla + Diamante)")
                        },
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF0097A7)),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(Icons.Default.Diamond, contentDescription = null, tint = Color.White)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("3. PLAN VIP (FLOTILLA AUTOZEN)")
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

