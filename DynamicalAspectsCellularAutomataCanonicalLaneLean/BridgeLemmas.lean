import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsCellularAutomataCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CellularAutomataWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse
