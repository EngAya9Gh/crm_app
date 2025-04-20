<?php
/**
 * AI Chat API
 * 
 * This file serves as an intermediary between the Flutter app and OpenAI API.
 * It receives question IDs and client IDs from the app, constructs appropriate
 * prompts based on database data, and forwards them to OpenAI.
 */

// Set headers to allow cross-origin requests and specify JSON content type
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Check if it's a POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // Method Not Allowed
    echo json_encode(['error' => 'Only POST requests are allowed']);
    exit();
}

// Get the request body and decode the JSON
$requestData = json_decode(file_get_contents('php://input'), true);

// Check if questionId is provided
if (!isset($requestData['questionId']) || empty($requestData['questionId'])) {
    http_response_code(400); // Bad Request
    echo json_encode(['error' => 'questionId is required']);
    exit();
}

$questionId = $requestData['questionId'];
$clientId = isset($requestData['clientId']) ? $requestData['clientId'] : null;

// Your OpenAI API key
$apiKey = 'your_openai_api_key_here';

// Function to get client data from database (mock implementation)
function getClientData($clientId) {
    // In a real implementation, you would query the database
    // For now, we'll return mock data
    return [
        'name' => 'شركة الأمل للتجارة',
        'contact' => 'أحمد محمد',
        'email' => 'ahmed@alamal.com',
        'phone' => '+966 50 123 4567',
        'registrationDate' => '2020-03-15',
        'payments' => [
            ['id' => 'INV-001', 'amount' => 15000, 'date' => '2022-01-15', 'status' => 'paid'],
            ['id' => 'INV-002', 'amount' => 12500, 'date' => '2022-03-20', 'status' => 'paid'],
            ['id' => 'INV-003', 'amount' => 18000, 'date' => '2022-06-10', 'status' => 'paid'],
            ['id' => 'INV-004', 'amount' => 20000, 'date' => '2022-09-05', 'status' => 'pending'],
            ['id' => 'INV-005', 'amount' => 22000, 'date' => '2022-12-01', 'status' => 'pending'],
        ],
        'support_tickets' => [
            ['id' => 'TIC-001', 'title' => 'مشكلة في تسجيل الدخول', 'date' => '2022-10-10', 'status' => 'closed'],
            ['id' => 'TIC-002', 'title' => 'استفسار عن الفاتورة', 'date' => '2022-11-05', 'status' => 'closed'],
            ['id' => 'TIC-003', 'title' => 'طلب ميزة جديدة', 'date' => '2022-12-15', 'status' => 'open'],
            ['id' => 'TIC-004', 'title' => 'خطأ في التقرير', 'date' => '2023-01-20', 'status' => 'open'],
        ],
        'purchases' => [
            ['product' => 'نظام إدارة المخزون', 'date' => '2021-01-10', 'price' => 50000],
            ['product' => 'نظام المحاسبة', 'date' => '2021-03-15', 'price' => 35000],
            ['product' => 'تطبيق الجوال', 'date' => '2022-05-20', 'price' => 45000],
        ],
    ];
}

function getdataClient_ai($clientId){
    $sql = "SELECT cl.name_enterprise,ac.name_activity_type FROM `clients` cl 
    
    inner join activity_type ac on ac.id_activity_type=cl.activity_type_fk
    WHERE id_clients=? ";
     $index=0;
        $selectArray = array();
        array_push($selectArray, $clientId);
        $result = dbExec($sql, $selectArray);
         $arrJson = array();
     $row = $result->fetch(PDO::FETCH_ASSOC);
                 $arrJson[] = $row;
                      $getArray = array();
                     array_push($getArray, $clientId);
     
                       $sql1 = "SELECT * FROM `client_comment` WHERE fk_client=? "; 
            
           $result1 = dbExec($sql1, $getArray);
         
         if ($result1->rowCount() > 0) {
            
             while ($row1 = $result1->fetch(PDO::FETCH_ASSOC)) {
                
                 $arrJsoncomment[] = $row1;
               
             }
             $arrJson[$index]["comments_client"]=$arrJsoncomment;
             
               $arrJsoncomment=array();
        
               return $arrJson;
         }
        
        } 
       
        
      
     
         
     
    
// Function to construct prompt based on questionId and client data
function constructPrompt($questionId, $clientData) {
    $basePrompt = '';
    
    switch ($questionId) {
        case 'client_payment_analysis':
            $basePrompt = 'قم بتحليل المدفوعات التالية للعميل وقدم توصيات للتحسين: ';
            // Add payment data
            $basePrompt .= 'بيانات المدفوعات: ' . json_encode($clientData['payments'], JSON_UNESCAPED_UNICODE);
            break;
              
            case 'client_close_analysis':
                $basePrompt = 'قم بتحليل المدفوعات التالية للعميل وقدم توصيات للتحسين: ';
                // Add payment data
                $basePrompt .= 'بيانات المدفوعات: ' . json_encode($clientData['payments'], JSON_UNESCAPED_UNICODE);
                break;

            case 'client_engagement':
            $basePrompt = 'اقترح طرقًا لزيادة مشاركة هذا العميل بناءً على البيانات التالية: ';
            // Add client engagement data
            $basePrompt .= 'تاريخ التسجيل: ' . $clientData['registrationDate'] . ', ';
            $basePrompt .= 'المشتريات: ' . json_encode($clientData['purchases'], JSON_UNESCAPED_UNICODE);
            break;
            
        case 'client_support_status':
            $basePrompt = 'قدم ملخصًا لمشاكل الدعم الفني للعميل والاقتراحات بناءً على البيانات التالية: ';
            // Add support ticket data
            $basePrompt .= 'تذاكر الدعم: ' . json_encode($clientData['support_tickets'], JSON_UNESCAPED_UNICODE);
            break;
            
        case 'client_opportunities':
            $basePrompt = 'حدد فرص البيع المتقاطع والبيع المتزايد لهذا العميل بناءً على المشتريات السابقة: ';
            // Add purchase history
            $basePrompt .= 'المشتريات السابقة: ' . json_encode($clientData['purchases'], JSON_UNESCAPED_UNICODE);
            break;
            
        case 'client_risk_assessment':
            $basePrompt = 'قم بتقييم مخاطر خسارة هذا العميل وقدم استراتيجيات للاحتفاظ به بناءً على: ';
            // Add client data for risk assessment
            $basePrompt .= 'تاريخ التسجيل: ' . $clientData['registrationDate'] . ', ';
            $basePrompt .= 'المدفوعات: ' . json_encode($clientData['payments'], JSON_UNESCAPED_UNICODE) . ', ';
            $basePrompt .= 'تذاكر الدعم: ' . json_encode($clientData['support_tickets'], JSON_UNESCAPED_UNICODE);
            break;
             
        // General questions (no client data needed)
        case 'sales_summary':
            $basePrompt = 'قم بإعداد تقرير موجز عن المبيعات الأخيرة مع التركيز على أعلى المنتجات مبيعًا';
            break;
            
        case 'client_recommendations':
            $basePrompt = 'اقترح استراتيجيات للتواصل مع العملاء غير النشطين وإعادة إشراكهم';
            break;
            
        case 'task_prioritization':
            $basePrompt = 'ساعدني في ترتيب أولويات المهام وتحسين إدارة الوقت لفريق المبيعات';
            break;
            
        case 'market_analysis':
            $basePrompt = 'قدم تحليلًا للاتجاهات الحالية في السوق وكيف يمكننا التكيف معها';
            break;
            
        case 'customer_support':
            $basePrompt = 'اقترح طرقًا لتحسين جودة خدمة العملاء وسرعة الاستجابة';
            break;
            
        default:
            $basePrompt = 'قم بتقديم معلومات مفيدة حول هذا الموضوع';
    }
    
    return $basePrompt;
}

// Call OpenAI API
function callOpenAI($prompt, $apiKey) {
    // This is a simplified example
    $curl = curl_init();
    
    $postFields = [
        'model' => 'gpt-3.5-turbo',
        'messages' => [
            [
                'role' => 'system',
                'content' => 'You are a helpful assistant for a CRM application. Provide concise, practical advice in Arabic language.'
            ],
            [
                'role' => 'user',
                'content' => $prompt
            ]
        ],
        'temperature' => 0.7,
        'max_tokens' => 500
    ];
    
    curl_setopt_array($curl, [
        CURLOPT_URL => 'https://api.openai.com/v1/chat/completions',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($postFields),
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $apiKey
        ],
    ]);
    
    $response = curl_exec($curl);
    $err = curl_error($curl);
    
    curl_close($curl);
    
    if ($err) {
        return ['error' => 'cURL Error: ' . $err];
    }
    
    $responseData = json_decode($response, true);
    
    if (isset($responseData['choices'][0]['message']['content'])) {
        return ['response' => $responseData['choices'][0]['message']['content']];
    } else {
        return ['error' => 'Failed to get response from OpenAI', 'details' => $responseData];
    }
}

// For development, you can use mock responses instead of actual API calls
function getMockResponse($questionId, $clientId) {
    // General questions
    if ($questionId == 'sales_summary') {
        return [
            'response' => 'تحليل المبيعات الأخيرة يظهر زيادة بنسبة 15٪ في مبيعات المنتج A مقارنة بالربع السابق. أعلى 3 منتجات من حيث المبيعات هي المنتج A والمنتج B والمنتج C. يُنصح بزيادة المخزون من هذه المنتجات لتلبية الطلب المتزايد.'
        ];
    } else if ($questionId == 'client_recommendations') {
        return [
            'response' => 'اقترح إرسال عروض خاصة للعملاء غير النشطين لأكثر من 3 أشهر. يمكنك أيضًا تنظيم حدث افتراضي لعرض المنتجات الجديدة وإعادة إشراك العملاء. التواصل المنتظم عبر البريد الإلكتروني مع محتوى ذي قيمة يساعد في الحفاظ على العلاقات.'
        ];
    } else if ($questionId == 'task_prioritization') {
        return [
            'response' => 'يمكن ترتيب المهام حسب العائد المتوقع وموعد التسليم. استخدم تقنية بوموردو للتركيز: 25 دقيقة عمل متبوعة بـ 5 دقائق راحة. حدد الأهداف الأسبوعية وقسمها إلى مهام يومية. خصص وقتًا محددًا للاجتماعات ووقتًا آخر للعمل دون مقاطعة.'
        ];
    } else if ($questionId == 'market_analysis') {
        return [
            'response' => 'تظهر تحليلات السوق الحالية زيادة الطلب على المنتجات الرقمية والخدمات عن بُعد. ينصح بتطوير منتجات تلبي هذه الاحتياجات. المنافسون الرئيسيون يتجهون نحو حلول متكاملة، لذا يمكن التفكير في تقديم حزم خدمات شاملة لزيادة القيمة للعملاء.'
        ];
    } else if ($questionId == 'customer_support') {
        return [
            'response' => 'لتحسين دعم العملاء، يمكن إنشاء قاعدة معرفة شاملة للأسئلة الشائعة، وتدريب الموظفين على تقنيات التعاطف والاستماع النشط. تنفيذ نظام تذاكر فعال يضمن عدم إغفال أي استفسار. قياس زمن الاستجابة ورضا العملاء بانتظام للتحسين المستمر.'
        ];
    }
    // Client-specific questions
    else if ($questionId == 'client_payment_analysis') {
        return [
            'response' => "تحليل مدفوعات العميل {$clientId} (شركة الأمل للتجارة): يظهر التحليل نمطًا إيجابيًا حيث سدد العميل جميع الفواتير السابقة في الوقت المحدد، ولديه فاتورتان معلقتان حاليًا بقيمة إجمالية 42,000 ريال. متوسط قيمة الفاتورة في ازدياد (من 15,000 إلى 22,000 ريال)، مما يشير إلى نمو في حجم الأعمال. التوصيات: 1) تقديم خصم 5٪ للدفع المبكر للفواتير المعلقة. 2) عرض خطة دفع سنوية مع خصم 10٪ للعام القادم. 3) زيادة حد الائتمان نظرًا لسجل الدفع الممتاز."
        ];
    } else if ($questionId == 'client_engagement') {
        return [
            'response' => "اقتراحات لزيادة مشاركة العميل {$clientId} (شركة الأمل للتجارة): 1) جدولة اجتماع ربع سنوي لمراجعة أداء الأنظمة المشتراة وتقديم نصائح لتحسين الاستخدام. 2) دعوة العميل لحضور ورشة عمل حصرية حول أحدث التقنيات في مجال إدارة المخزون. 3) إنشاء مجموعة مستخدمين خاصة للعملاء المميزين مثل شركة الأمل، لتبادل الخبرات والأفكار. 4) تقديم عرض تجريبي مجاني لمدة شهر لأحد المنتجات المكملة التي لم يشتريها بعد."
        ];
    } else if ($questionId == 'client_support_status') {
        return [
            'response' => "ملخص حالة الدعم للعميل {$clientId} (شركة الأمل للتجارة): توجد تذكرتان مفتوحتان حاليًا: 'طلب ميزة جديدة' و'خطأ في التقرير'. تم إغلاق تذكرتين سابقتين بنجاح خلال الأشهر الماضية. وقت الاستجابة الأولي للتذاكر حوالي 4 ساعات، وهو ضمن المعدل المستهدف. الملاحظات: العميل يواجه مشاكل متكررة في التقارير. الاقتراحات: 1) تعيين مدير حساب تقني مخصص للعميل. 2) تقديم جلسة تدريبية مخصصة على استخدام نظام التقارير. 3) عرض الترقية إلى الإصدار الجديد من نظام التقارير الذي يحل المشاكل المتكررة."
        ];
    } else if ($questionId == 'client_opportunities') {
        return [
            'response' => "فرص البيع للعميل {$clientId} (شركة الأمل للتجارة): بناءً على المشتريات السابقة (نظام إدارة المخزون، نظام المحاسبة، وتطبيق الجوال)، نوصي بالفرص التالية: 1) نظام تحليل البيانات والذكاء الاصطناعي - يتكامل مع أنظمتهم الحالية ويوفر رؤى تحليلية متقدمة (فرصة بيع متقاطع). 2) الترقية إلى حزمة الأعمال المتكاملة الشاملة - توحيد جميع الأنظمة في منصة واحدة (فرصة ترقية). 3) خدمة الدعم الفني الممتاز - خدمة دعم على مدار الساعة مع زمن استجابة مضمون (خدمة إضافية). الفرصة الأكثر ربحية: حزمة الأعمال المتكاملة بهامش ربح 45٪."
        ];
    } else if ($questionId == 'client_risk_assessment') {
        return [
            'response' => "تقييم مخاطر العميل {$clientId} (شركة الأمل للتجارة): مستوى الخطر: منخفض إلى متوسط. نقاط القوة: علاقة طويلة الأمد (منذ 2020)، نمط شراء متنوع، سجل دفع ممتاز للفواتير السابقة. نقاط الضعف: تذكرتا دعم مفتوحتان قد تشير إلى عدم رضا، الفجوة بين المشتريات متباعدة (كل 2-3 أشهر). استراتيجيات الاحتفاظ: 1) تسريع حل تذاكر الدعم المفتوحة مع متابعة شخصية من مدير الحساب. 2) تقديم عرض تجديد مبكر للتراخيص السنوية مع خصم خاص. 3) دعوة ممثلين من الشركة لحضور فعالية العملاء المميزين القادمة. 4) تقديم تدريب مجاني على الميزات المتقدمة للأنظمة المستخدمة."
        ];
    } else {
        return [
            'response' => 'شكراً لاستخدام مساعد الذكاء الاصطناعي. يرجى تحديد أحد الخيارات المتاحة للحصول على تحليل مخصص.'
        ];
    }
}

// Main logic
$clientData = null;
if ($clientId) {
    // Get client data from database
    $clientData = getClientData($clientId);
    
    // Construct prompt based on questionId and client data
    $prompt = constructPrompt($questionId, $clientData);
    
    // Uncomment the line below to use the actual OpenAI API
    // $result = callOpenAI($prompt, $apiKey);
} else {
    // For general questions without client context, use simpler prompts
    $prompt = constructPrompt($questionId, null);
    
    // Uncomment the line below to use the actual OpenAI API
    // $result = callOpenAI($prompt, $apiKey);
}

// Using mock responses for development
$result = getMockResponse($questionId, $clientId);

// Return the result as JSON
echo json_encode($result); 